class SessionsController < ApplicationController

  def new
  end

  def login
    if session[:host_id] || session[:entertainer_id]
      redirect_to events_path
    else
      render :login
    end
  end

  def host_signup
    if session[:host_id] || session[:entertainer_id]
      redirect_to events_path
    else
      @host = Host.new
      render :host_signup
    end
  end

  def entertainer_signup
    if session[:host_id] || session[:entertainer_id]
      redirect_to events_path
    else
      @entertainer = Entertainer.new
      render :entertainer_signup
    end
  end

  def create
    create_session_flow
  end

  def destroy
    session.delete :host_id
    session.delete :entertainer_id
    redirect_to login_path
  end

  private

  def user_auth_flow(user, id_sym)
    if user.authenticate(params[:password])
      session[id_sym] = user.id
      redirect_to polymorphic_path(user)
    else
      flash.now[:danger] = "Invalid email/password combination. Try again!"
      render :login
    end
  end

  def create_session_flow
    this_class = params[:user_type].constantize
    class_name_dc = params[:user_type].downcase
    if this_class.find_by(username: params[:username])
      @class_name_dc = this_class.find_by(username: params[:username])
      user_auth_flow(@class_name_dc, (params[:user_type].downcase + "_id").to_sym)
    else
      flash.now[:danger] = "No such user exists. Sign up or try again!"
      render :login
    end
  end
end

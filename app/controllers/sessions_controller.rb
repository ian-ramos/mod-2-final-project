class SessionsController < ApplicationController

  def new
  end

  def login
    render :login
  end

  def host_signup
    @host = Host.new
    render :host_signup
  end

  def entertainer_signup
    @entertainer = Entertainer.new
    render :entertainer_signup
  end

  def create
    if params[:user_type] == "Host"
      if Host.find_by(username: params[:username])
        @host = Host.find_by(username: params[:username])
        return head(:forbidden) unless @host.authenticate(params[:password])
        session[:host_id] = @host.id
        redirect_to host_path(@host)
      else
        redirect_to login_path
      end
    elsif params[:user_type] == "Entertainer"
      if Entertainer.find_by(username: params[:username])
        @entertainer = Entertainer.find_by(username: params[:username])
        return head(:forbidden) unless @entertainer.authenticate(params[:password])
        session[:entertainer_id] = @entertainer.id
        redirect_to entertainer_path(@entertainer)
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete :host_id
    session.delete :entertainer_id
    redirect_to login_path
  end

end

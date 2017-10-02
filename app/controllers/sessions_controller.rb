class SessionsController < ApplicationController

  def new
  end

  def create
    if @host = Host.find_by(username: params[:username])
      session[:host_id] = @host.id
      redirect_to host_path(@host)
    else
      @entertainer = Entertainer.find_by(username: params[:username])
      session[:entertainer_id] = @entertainer.id
      redirect_to entertainer_path(@entertainer)
    end
  end

  def destroy
    session.delete :host_id
    session.delete :entertainer_id
    redirect_to login_path
  end

end

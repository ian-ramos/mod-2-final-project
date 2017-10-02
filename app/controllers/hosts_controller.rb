class HostsController < ApplicationController

  def index
    @hosts = Host.all
  end

  def show
    @host = Host.find(params[:id])
  end

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
    if @host.save
      redirect_to host_path(@host)
    else
      render :new
    end
  end

  def edit
    @host = Host.find(params[:id])
  end

  def update
    Host.find(params[:id]) ? @host = Host.find(params[:id]) : @host = Host.find(session[:host_id])
    @host.events.find(params[:event_id]).entertainers.clear #clears the entertainers for this current event
    if @host.update(host_params)
      entertainer_usernames(@host, params[:host][:entertainer_usernames], params[:event_id]) #calls private method that updates entertainers list
      redirect_to host_path(@host)
    else
      render :edit
    end
  end

  def destroy
    @host = Host.find(params[:id])
    @host.destroy
    redirect_to hosts_path
  end

  private

  def host_params
    params.require(:host).permit(:username)
  end

  def entertainer_usernames(host, usernames, event_id) #takes the entertainers from the event show page and updates entertainers list for that host's event
    array = usernames.reject {|username| username == ""}
    array.each do |username|
      entertainer = Entertainer.find_by(username: username)
      host.events.find(event_id).entertainers << entertainer
    end
  end

end

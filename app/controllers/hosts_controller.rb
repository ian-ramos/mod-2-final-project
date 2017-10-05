class HostsController < ApplicationController
  before_action :require_login, except: :create


  layout "directory", except: :create


  def index
    @hosts = Host.all
  end

  def show
    @host = Host.find(params[:id])
  end


  def create
    @host = Host.new(host_params)
    if @host.save
      session[:host_id] = @host.id
      redirect_to host_path(@host)
    else
      render :'sessions/host_signup'
    end
  end

  def edit
    @host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
    if @host.update(host_params)
      redirect_to host_path(@host)
    else
      render :edit
    end
  end

  def update_entertainers #update coming from event show page
    @host = Host.find(session[:host_id])
    if params.include?(:host)
      Event.find(params[:event_id]).entertainers.clear
      entertainer_ids(params[:host][:entertainer_ids], params[:event_id])
      Event.find(params[:event_id]).update(closed_status: true)
      redirect_to host_path(@host)
    else
      Event.find(params[:event_id]).entertainers.clear
      redirect_to host_path(@host)
    end
  end

  def destroy
    @host = Host.find(params[:id])
    @host.destroy
    session.delete :host_id
    session.delete :entertainer_id
    redirect_to '/'
  end

  private

  def host_params
    params.require(:host).permit(:username, :password, :password_confirmation, entertainer_ids: [])
  end

  def entertainer_usernames(host, usernames, event_id) #takes the entertainers from the event show page and updates entertainers list for that host's event
    array = usernames.reject {|username| username == ""}
    array.each do |username|
      entertainer = Entertainer.find_by(username: username)
      host.events.find(event_id).entertainers << entertainer
    end
  end

  def entertainer_ids(entertainer_ids, event_id)
    entertainer_ids.each do |entertainer_id|
      entertainer = Entertainer.find(entertainer_id)
      Event.find(event_id).entertainers << entertainer
    end
  end

end

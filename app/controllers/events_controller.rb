class EventsController < ApplicationController
  before_action :require_login


  layout "directory"


  def index
    @events = Event.all
    @entertainer = Entertainer.find_by(id: session[:entertainer_id])
  end

  def show
    @host = Host.find_by(id: session[:host_id]) #find_by instead of find so that it equals nil if it can't find it (rather than breaking)
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new(name: "Event name", description: "Place description here", date: Date.today)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
     if @event.update
       redirect_to event_path(@event)
     else
       render :edit
     end
  end

  def destroy
    @event = Event.find(params[:id]).destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :host_id)
  end

end

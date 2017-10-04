class EntertainersController < ApplicationController
  before_action :require_login, except: :create

  layout "directory", except: :create

  def index
    @entertainers = Entertainer.all
  end

  def show
    @entertainer = Entertainer.find(params[:id])
  end


  def create
    @entertainer = Entertainer.new(entertainer_params)
    if @entertainer.save
      session[:entertainer_id] = @entertainer.id
      redirect_to entertainer_path(@entertainer)
    else
      render :'sessions/entertainer_signup'
    end
  end

  def edit
    @entertainer = Entertainer.find(params[:id])
  end

  def update
    @entertainer = Entertainer.find(params[:id])
    if @entertainer.update(entertainer_params)
      redirect_to entertainer_path(@entertainer)
    else
      render :edit
    end
  end

  def update_events #update coming from events index page
    @entertainer = Entertainer.find(session[:entertainer_id])
    if params.include?(:entertainer)
      @entertainer.events.clear
      @entertainer.update(entertainer_params)
      redirect_to entertainer_path(@entertainer)
    else
      @entertainer.events.clear
      redirect_to entertainer_path(@entertainer)
    end
  end

  def destroy
    @entertainer = Entertainer.find(params[:id])
    @entertainer.destroy
    redirect_to entertainers_path
  end

  def filter
    @entertainers = Entertainer.all.select {|ent| ent.job_type == params[:job_type]}
    render :index
  end

  private

  def entertainer_params
    params.require(:entertainer).permit(:username, :job_type, :image, :rate, :description, :password, :password_confirmation, event_ids: [])
  end


end

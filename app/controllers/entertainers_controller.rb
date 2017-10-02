class EntertainersController < ApplicationController

  def index
    @entertainers = Entertainer.all
  end

  def show
    @entertainer = Entertainer.find(params[:id])
  end

  def new
    @entertainer = Entertainer.new
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
      redirect_to entertainers_path(@entertainer)
    else
      render :edit
    end
  end

  def destroy
    @entertainer = Entertainer.find(params[:id])
    @entertainer.destroy
    redirect_to entertainers_path
  end

  private

  def entertainer_params
    params.require(:entertainer).permit(:username, :job_type, :image)
  end

end

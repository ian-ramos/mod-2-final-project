class MessagesController < ApplicationController

  def index
    @messages = Message.all
    host_or_entertainer
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    host_or_entertainer
  end

  def create
    @message = Message.new(message_params)
    host_or_entertainer
    if @message.save
      if @host
        @message.sender(@host.username)
        @message.receiver(params[:message][:entertainer_username])
      else
        @message.sender(@entertainer.username)
        @message.receiver(params[:message][:host_username])
      end
      redirect_to messages_path
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    Message.sender_receiver_delete(@message) #need to delete from sender & receiver hash as well
    @message.destroy
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :host_username, :entertainer_username, :content)
  end

  def host_or_entertainer #sets host or entertainer variable based on who's logged in
    session[:host_id] ? @host = Host.find(session[:host_id]) : @entertainer = Entertainer.find(session[:entertainer_id])
  end

end

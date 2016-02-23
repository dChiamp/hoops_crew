class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render :index
  end

  def show
    @message = Message.find(params[:id])
    render :show
  end

  def new
    @message = Message.new
    render :new
  end

  def create
    @message = Message.create(message_params)
    if @message 
      # login(@user)
      # flash.alert = "message posted!"
      redirect_to "/messages"
    else 
      # flash[:notice] = "somethings wrong"
      redirect_to "/events"
    end
  end

  def edit
    @message = Message.find(params[:id])
     render :edit
    # if authorize?
    #   # if @right_person
    #   render :edit
    # else 
    #   redirect_to "/events"
    # end
  end

  def update
    @message = Message.find(params[:id])
    # update the user
    @message.update_attributes(message_params)
    redirect_to "/events"
  end

  def destroy
    Message.destroy(params[:id])
  end

  private
  def message_params
    #must this be full validation params??
    params.require(:message).permit(:content)
  end

end

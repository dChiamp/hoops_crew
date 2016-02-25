class EventsController < ApplicationController
  before_action :logged_in?, only: :index

  # need to create one event per week,
  # and update date for the week.
  #update vote counts, so basically full routes
  # going to need helper methods for vote logic 
  def index
    @events = Event.all
    # render "/users/:user_id/events"
    render :index
  end

  # def day_vote
  #  @saturday = Event.find(params[:sat_vote])
  #  @sunday = Event.find(params[:sun_vote])
  # end

# add +1 to db logic in post,
# actually prob check tru false and then convert
#that to +1 in db

  def show
    @event = Event.find(params[:event_id])
    # render "users/:user_id/events/:event_id"
    render :show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(params[event_params])
    if @event 
      flash[:notice] = "Your vote has been cast"
    else 
      flash[:notice] = "Something went wrong :( "
    end
  end

  def edit
    @event = Event.find(params[:event_id])
  end

  def update 
    @event = Event.find(params[:event_id])
    @event.update_attributes(event_params)
    # if @saturday
    #   @vote.update_attributes(:sat_votes, @vote.sat_vote + 1)
    # elsif @sunday
    #   vote.update_attributes(:sun_votes, @vote.sun_vote + 1)
    # end
  end


  def sat_vote
    p "got to sat vote!"
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @event.update_attribute(:sat_votes, @event.sat_votes + 1)
    @user.update_attribute(:voted, @user.voted = true)
    render :show
    flash[:notice] = "Your vote has been cast! NO take-backsies"
  end

  def sun_vote
    p "got to sun vote"
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @event.update_attribute(:sun_votes, @event.sun_votes + 1)
    @user.update_attribute(:voted, @user.voted = true)
    render :show
    flash[:notice] = "Your vote has been cast! NO take-backsies"
  end

  def vote
    p params
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    if params[:vote_day] == "sat"
      @event.update_attribute(:sat_votes, @event.sat_votes + 1)
      @user.update_attribute(:voted, @user.voted = true)
    elsif params[:vote_day] == "sun"
      @event.update_attribute(:sun_votes, @event.sun_votes + 1)
      @user.update_attribute(:voted, @user.voted = true)
    end
    render :show
    flash[:notice] = "Your vote has been cast! NO take-backsies"
  end




  def destroy
    Event.destroy(params[:event_id])
  end

  private
  def event_params
    params.require(:event).permit(:sat_votes, :sun_votes)
  end

end

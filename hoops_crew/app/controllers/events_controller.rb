class EventsController < ApplicationController
  before_action :logged_in?, only: :index

  # need to create one event per week,
  # and update date for the week.
  #update vote counts, so basically full routes
  # going to need helper methods for vote logic 
  def index
    @votes = Event.all
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
    @vote = Event.find(params[:event_id])
    # render "users/:user_id/events/:event_id"
    render :show
  end

  def new
    @vote = Event.new
  end

  def create
    @vote = Event.create(params[event_params])
    if @vote 
      flash[:notice] = "Your vote has been cast"
    else 
      flash[:notice] = "Something went wrong :( "
    end
  end

  def edit
    @vote = Event.find(params[:event_id])
  end

  def update 
    @vote = Event.find(:event_id)
    @vote.update_attributes(event_params)
    # if @saturday
    #   @vote.update_attributes(:sat_vote, @vote.sat_vote + 1)
    # elsif @sunday
    #   vote.update_attributes(:sun_vote, @vote.sun_vote + 1)
    # end
  end

  def destroy
    Event.destroy(params[:event_id])
  end

  private
  def event_params
    params.require(:event).permit(:sat_votes, :sun_votes)
  end

end

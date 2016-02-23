class EventsController < ApplicationController
  # before_action :logged_in?, only: :index
  def index
    @events = Event.all
    render :index
  end
end

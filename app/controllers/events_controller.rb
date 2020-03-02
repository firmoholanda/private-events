class EventsController < ApplicationController
  before_action :logged_in_user
  before_action :host_user, only: [:destroy]

  def new
    @event = current_user.events_as_host.new()
  end

  def create
    @event = current_user.events_as_host.build(event_params)
    @event.save
    flash[:success] = "Event created"
    redirect_to root_path
  end

  def show
    unless (@event = Event.find_by(id: params[:id]))
      redirect_to user_path(current_user)
    end
  end

  def index
    @prev_events = Event.past
    @upcoming_events = Event.upcoming
  end

  private
    def event_params
      params.require(:event).permit(:description)
    end

end

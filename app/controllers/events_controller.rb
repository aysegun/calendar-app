class EventsController < ApplicationController
  before_action :set_event, only: %i[show destroy edit update]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show; end
  def edit; end

  def update
    if @event.update(event_params)
      flash[:notice] = 'Event successfully updated'
      redirect_to event_path
    else
      render edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time)
  end
end

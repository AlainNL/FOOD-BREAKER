class EventsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
      events.address ILIKE :query
      OR events.language ILIKE :query
      OR events.date ILIKE :query
      SQL
      @events = Event.joins(:users).where(sql_query, query: "%#{params[:query]}%")
    else
      @events = Event.all
    end
    @event = Event.new
    @booking = Booking.new
  end

  def show
    @events = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :photos)
  end

end

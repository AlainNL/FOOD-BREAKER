class EventsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        events.address ILIKE :query
        OR events.language ILIKE :query
        OR events.date ILIKE :query
      SQL
      @events = Event.joins(:users).where(sql_query, query: "%#{params[:query]}%")
      # je ne pense pas qu'il y ait besoin  de faire une jointure sur la table user. on cherche juste les events
      raise
    else
      @events = Event.all
    end
    @event = Event.new
    @booking = Booking.new
  end

  def show
    @event = Event.find(params[:id])
    @markers = [
      {
        lat: @event.latitude,
        lng: @event.longitude
      }
    ]
  end

  private

  def event_params
    params.require(:event).permit(:title, :category, :address, :description, :date, :language, :capacity, :rating, :photos, :user_id)
  end
end

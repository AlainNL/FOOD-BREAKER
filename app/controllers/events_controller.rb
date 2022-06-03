class EventsController < ApplicationController
  def index
    if params[:address].present?
      sql_query = <<~SQL
        events.address ILIKE :query
      SQL
      @events = Event.where(sql_query, query: "%#{params[:address]}%")
      # jointure pour chercher 1 participant
   elsif params[:language].present?
      sql_query = <<~SQL
        events.language ILIKE :query
      SQL
      @events = Event.where(sql_query, query: "%#{params[:language]}%")
    elsif params[:date].present?
      sql_query = <<~SQL
        events.date ILIKE :query
      SQL
      @events = Event.where(sql_query, query: "%#{params[:date]}%")
    else
      @events = Event.all
    end
    @event = Event.new
    @booking = Booking.new
    #raise
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
    params.require(:event).permit(:title, :category, :address, :description, :date, :language, :capacity, :rating, :photos, :user_id, :query)
  end
end

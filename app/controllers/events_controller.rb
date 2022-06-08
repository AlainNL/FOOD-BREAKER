class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.order("events.date ASC")
    @review = Review.new

    if params.dig(:filters, :address).present?
      sql_query = <<~SQL
        events.address ILIKE :query
      SQL
      @events = @events.where(sql_query, query: "%#{params.dig(:filters, :address)}%").order("events.date ASC")
    end

    if params.dig(:filters, :language).present?
      @events = @events.where(language: params.dig(:filters, :language))
    end

    if params.dig(:filters, :date).present?
      @events = @events.where(date: params.dig(:filters, :date))
    end

    if params.dig(:filters, :categories).present?
      @events = @events.where(category: params.dig(:filters, :categories))
    end

    @event = Event.new
    @booking = Booking.new
  end

  def create
    #Creation d'Event
    #Création de chatroom lié à l'event
    @event = Event.new(event_params)
    @event.user = current_user
    @event.save

    if @event.save
      @chatroom = Chatroom.new
      @chatroom.event = @event
      @chatroom.save
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :category, :address, :description, :date, :language, :capacity, :rating, photos: [])
  end
end

class EventsController < ApplicationController
  def index
    # raise
    @events = Event.order("events.date ASC")
    @review = Review.new
    if params.dig(:filters, :address).present?
      sql_query = <<~SQL
        events.address ILIKE :query
      SQL
      @events = @events.where(sql_query, query: "%#{params.dig(:filters, :address)}%").order("events.date ASC")
    end

    if params.dig(:filters, :language).present?
      # sql_query = <<~SQL
      #   events.language ILIKE :query
      # SQL
      # @events = Event.where(sql_query, query: "%#{params.dig(:filters, :language)}%").order("events.date ASC")
      @events = @events.where(language: params.dig(:filters, :language))
    end

    if params.dig(:filters, :date).present?
      @events = @events.where(date: params.dig(:filters, :date))
    end

    if params.dig(:filters, :categories).present?
      @events = @events.where(category: params.dig(:filters, :categories))
    end

  #   if params[:address].present?
  #     sql_query = <<~SQL
  #       events.address ILIKE :query
  #     SQL
  #     @events = Event.where(sql_query, query: "%#{params[:address]}%").order("events.date ASC")
  #     # jointure sur User pour chercher 1 participant
  #  elsif params[:language].present?
  #     sql_query = <<~SQL
  #       events.language ILIKE :query
  #     SQL
  #     @events = Event.where(sql_query, query: "%#{params[:language]}%").order("events.date ASC")
  #   elsif params[:date].present?
  #     sql_query = <<~SQL
  #       events.date >= Date.today :query
  #     SQL
  #     # A changer pour prendre toutes les dates à partir de la date saisie
  #     @events = Event.where(sql_query, query: "%#{params[:date]}%").order("events.date ASC")
  #     # category buttons
  #   elsif params[:category]
  #     sql_query = <<~SQL
  #       events.category >= Date.today :query
  #     SQL
  #     # A changer pour prendre toutes les dates à partir de la date saisie
  #     @events = Event.where(sql_query, query: "%#{params[:date]}%").order("events.date ASC")
  #   else
  #     @events = Event.all.order("events.date ASC")
  #   end
    @event = Event.new
    @booking = Booking.new
    @event = Event.all
    #raise
  end

       # events.date ILIKE :query

  def show
    @event = Event.find(params[:id])
    @review = Review.new
    @markers = [
      {
        lat: @event.latitude,
        lng: @event.longitude
      }
    ]
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
      redirect_to chatroom_path(@chatroom)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :category, :address, :description, :date, :language, :capacity, :rating, :photos, :query)
  end
end

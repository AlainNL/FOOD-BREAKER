class EventsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        events.address ILIKE :query
        OR events.language ILIKE :query
        OR events.date ILIKE :query
      SQL
      @events = Event.joins(:users).where(sql_query, query: "%#{params[:query]}%")
      # 1) je ne pense pas qu'il y ait besoin  de faire une jointure sur la table user. on cherche juste les events. 2) J'ai ajouté query en strong params 3) Est-ce qu'on peut avoir une seule zone query ou il faut faire query 1, query 2, query 3, est ce qu'on peut ajouter facilement l'autocomplete 4)il manque un bouton submit ou une icone submit sur la view
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
    params.require(:event).permit(:title, :category, :address, :description, :date, :language, :capacity, :rating, :photos, :user_id, :query)
  end
end

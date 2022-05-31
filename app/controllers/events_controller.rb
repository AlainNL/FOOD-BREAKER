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
  end

  def show
    @events = Event.find(params[:id])
  end
end

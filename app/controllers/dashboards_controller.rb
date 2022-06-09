class DashboardsController < ApplicationController
  # skip_after_action :verify_authorized, only: %i[myevents mybookings]

  def dashboard
    @user = current_user
    @myevents = @user.events.order("events.date ASC")
    @mybookings = @user.bookings.map {|booking| booking.event}
    @my_futur_bookings = @mybookings.select {|event| event.date >= Time.now}
    @my_past_bookings = @mybookings.select {|event| event.date < Time.now}
    @my_past_events = @user.events.where("date < ?", Time.now)
  end
end

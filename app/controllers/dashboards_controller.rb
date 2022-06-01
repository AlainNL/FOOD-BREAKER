class DashboardsController < ApplicationController

  def myEvents
    # AS AN HOST
    @user = current_user
    @myevents = @user.events
  end

  def myBookings
    # AS A GUEST
    @user = current_user
    @bookings = @user.bookings
  end
end

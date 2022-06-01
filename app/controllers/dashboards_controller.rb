class DashboardsController < ApplicationController
  # skip_after_action :verify_authorized, only: %i[myevents mybookings]

  def myevents
    # AS AN HOST
    @user = current_user
    @myevents = @user.events
  end

  #def mybookings
    # AS A GUEST
  #  @user = current_user
  #  @mybookings = @user.bookings
  # end
end

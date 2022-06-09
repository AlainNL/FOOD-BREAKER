class BookingsController < ApplicationController
  before_action :set_event, only: %i[new create]

  def create
    @booking = Booking.new(booking_params)
    ####
    ####if @event.bookings.count >= @event.capacity
      #ne peut pas créer de booking
    ####end
    ####

    @booking.event = @event
    @booking.user = current_user

    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def booking_params
    params.require(:booking).permit(:nb_guest, :user_id, :event_id)
  end

end

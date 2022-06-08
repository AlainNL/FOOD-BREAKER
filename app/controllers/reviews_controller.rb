class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking

    respond_to do |format|
      if @review.save
        format.html { redirect_to events_path }
        format.json
      else
        format.html { render "events/index", status: :unprocessable_entity }
        format.json
      end
    end
  end

private

  def review_params
    params.require(:review).permit(:content)
  end
end

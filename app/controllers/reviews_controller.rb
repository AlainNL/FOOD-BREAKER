class ReviewsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.event = @event

    respond_to do |format|
      if @review.save
        format.html { redirect_to event_path(@event) }
        format.json
      else
        format.html { render "events/show", status: :unprocessable_entity }
        format.json
      end
    end
  end

private

  def review_params
    params.require(:review).permit(:content)
  end
end

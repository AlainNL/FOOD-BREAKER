if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {event: @event, review: Review.new})
  json.inserted_item render(partial: "events/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {event: @event, review: @review})
end

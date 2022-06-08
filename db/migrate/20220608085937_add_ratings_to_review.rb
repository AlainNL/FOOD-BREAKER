class AddRatingsToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :rate, :integer
    remove_reference :reviews, :event, index: true, foreign_key: true
    add_reference :reviews, :booking, index: true, foreign_key: true
  end
end

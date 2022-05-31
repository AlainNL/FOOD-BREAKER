class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :category
      t.string :address
      t.text :description
      t.datetime :date
      t.string :language
      t.integer :capacity
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

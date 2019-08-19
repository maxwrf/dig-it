class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :digger, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :review
      t.integer :rating
      t.boolean :approved

      t.timestamps
    end
  end
end

class CreateDiggers < ActiveRecord::Migration[5.2]
  def change
    create_table :diggers do |t|
      t.string :name
      t.text :technical_specification
      t.date :start_date
      t.date :end_date
      t.string :photo
      t.float :day_rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

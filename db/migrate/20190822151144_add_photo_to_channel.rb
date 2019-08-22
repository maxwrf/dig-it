class AddPhotoToChannel < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :photo, :string
  end
end

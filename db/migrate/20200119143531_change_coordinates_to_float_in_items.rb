class ChangeCoordinatesToFloatInItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :latitude, :float
    change_column :items, :longitude, :float
  end
end

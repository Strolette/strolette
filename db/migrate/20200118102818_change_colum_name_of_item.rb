class ChangeColumNameOfItem < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :lat, :latitude
    rename_column :items, :long, :longitude
  end
end

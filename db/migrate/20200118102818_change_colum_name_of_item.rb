class ChangeColumNameOfItem < ActiveRecord::Migration[6.0]
  def change
    rename_column :item, :lat, :latitude
    rename_column :item, :long, :longitude
  end
end

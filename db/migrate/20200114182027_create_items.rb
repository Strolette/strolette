class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :category
      t.string :tag
      t.text :description
      t.integer :price_in_cents
      t.string :address
      t.boolean :availability
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end

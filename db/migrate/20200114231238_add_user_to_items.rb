class AddUserToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :user, foreign_key: true, index: true
  end
end

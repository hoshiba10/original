class AddItemsToItems < ActiveRecord::Migration
  def change
    add_column :items, :accept_user_id, :integer
  end
end

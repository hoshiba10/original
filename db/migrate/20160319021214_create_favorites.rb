class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true
      t.references :item, index: true
      t.boolean :delete_flg

      t.timestamps null: false
      
      t.index [:user_id, :item_id], unique: true
    end
  end
end

class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.references :item
      t.integer :item_user_id
      t.integer :receive_user_id
      t.text :chat_content
      t.boolean :delete_flg

      t.timestamps null: false
    end
  end
end

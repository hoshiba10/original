class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :titile
      t.string :content
      t.string :image
      t.boolean :sold_out_flg

      t.timestamps null: false
    end
  end
end

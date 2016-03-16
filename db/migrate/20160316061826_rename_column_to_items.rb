class RenameColumnToItems < ActiveRecord::Migration
  def change
    rename_column :items, :titile, :title
  end
end

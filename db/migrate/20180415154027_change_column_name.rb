class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :items, :item_title, :title
  end
end

class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_title
      t.date :date
      t.string :location
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end

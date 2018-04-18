class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :zip_code, :integer
    add_column :users, :city, :string
  end
end

class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :zip_code, :integer
    add_column :users, :phone_number, :integer, :limit => 8
    add_column :users, :company, :string
  end
end

class ChangeFieldsForUsers < ActiveRecord::Migration
  def change
    remove_column :users, :phone_number, :integer, :limit => 8
    add_column :users, :phone, :integer, :limit => 8
  end
end

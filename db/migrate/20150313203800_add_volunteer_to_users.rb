class AddVolunteerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :volunteer, :boolean, null: false, default: false
  end
end

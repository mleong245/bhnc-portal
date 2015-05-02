class CreateUserHours < ActiveRecord::Migration
  def change
    create_table :user_hours do |t|
      t.integer :user_id
      t.integer :available_hour_id
    end
  end
end

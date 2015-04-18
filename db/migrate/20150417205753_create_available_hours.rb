class CreateAvailableHours < ActiveRecord::Migration
  def change
    create_table :available_hours do |t|
      t.string :day_of_week
      t.string :start
      t.string :end
    end
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :Event_Name
      t.datetime :Event_Date
      t.string :Event_Description
    end
  end
end
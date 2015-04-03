class CreateSpaceRentalRequests < ActiveRecord::Migration
  def change
    create_table :space_rental_requests do |t|
      t.string :location
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end

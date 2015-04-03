class AddUserRefToSpaceRentalRequests < ActiveRecord::Migration
  def change
    add_reference :space_rental_requests, :user, index: true
    add_foreign_key :space_rental_requests, :users
  end
end

class AddApprovedToSpaceRentalRequests < ActiveRecord::Migration
  def change
    add_column :space_rental_requests, :approved, :boolean, null: false, default: false
  end
end

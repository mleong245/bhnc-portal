class AddDescriptionToSpaceRentalRequests < ActiveRecord::Migration
  def change
    add_column :space_rental_requests, :description, :string
  end
end

class UserController < ApplicationController
  def show
    @events = Event.upcoming
    @space_rental_locations = SpaceRentalRequest.allLocations
    @space_rental_requests = {}
    @space_rental_locations.each do |location|
        @space_rental_requests[location] = SpaceRentalRequest.where(:location => location, :approved => true)
    end
  end

end

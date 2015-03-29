class SpaceRentalRequest < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :location
  validates_presence_of :start
  validates_presence_of :end

  # Update later once we get list of spaces to rent
  def self.allLocations
    return ['Location1', 'Location2', 'Location3']
  end
end

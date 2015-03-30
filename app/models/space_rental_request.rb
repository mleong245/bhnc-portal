class SpaceRentalRequest < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :location
  validates_presence_of :start
  validates_presence_of :end

  # Update later once we get list of spaces to rent
  def self.allLocations
    return ['Location1', 'Location2', 'Location3']
  end

  def approved?
    self.approved
  end

  def has_conflict
    SpaceRentalRequest.where(:approved => true).find_each do |request|
      if self.location == request.location && (overlaps_with(request.start) || overlaps_with(request.end))
        self.errors.add(:base, 'Request conflicts with an existing approved request')
        return true
      end
    end
    return false
  end

  private

  def overlaps_with(time)
    return time > self.start && time < self.end
  end
end

class SpaceRentalRequest < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :location
  validates_presence_of :start
  validates_presence_of :end
  validate :start_time_must_be_earlier_than_end_time

  # Update later once we get list of spaces to rent
  def self.allLocations
    return ['Location1', 'Location2', 'Location3']
  end

  def approved?
    self.approved
  end

  def has_conflict
    SpaceRentalRequest.where(:approved => true, :location => self.location).find_each do |request|
      if overlaps_with(request.start) || overlaps_with(request.end)
        self.errors.add(:base, "#{self.location} is reserved at that time")
        return true
      end
    end
    return false
  end

  def start_time_must_be_earlier_than_end_time
    if self.end < self.start
      self.errors.add(:base, 'Request start time is after end time.')
    end
  end

  def starts_at
    self.start
  end

  private

  def overlaps_with(time)
    return time >= self.start && time <= self.end
  end
end

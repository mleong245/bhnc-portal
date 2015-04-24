class SpaceRentalRequest < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :location
  validates_presence_of :start
  validates_presence_of :end
  validate :start_time_must_be_earlier_than_end_time

  # Update later once we get list of spaces to rent
  def self.allLocations
    return ['BHNC 515 Cortland St downstairs multipurpose room', 'BHNC 515 Cortland St upstairs conference room', 'ECC 4468 Mission Street']
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

  def display_name?(time)
    self.user != nil && self.start >= time && self.start < (time + 0.5.hours)
  end

  def self.highlight?(rentals, time)
    rentals.each do |rental|
      if rental.display_name?(time) || rental.overlaps_with(time + 1.second)
        return true
      end
    end
    return false
  end

  def first_and_last_initial
    "#{self.user.first_name} #{self.user.last_name.to_s[0]}"
  end

  def overlaps_with(time)
    return time >= self.start && time <= self.end
  end

  def display_time(time)
    return time.strftime('%m/%d/%Y %l:%M %p')
  end
end

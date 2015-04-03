class Event < ActiveRecord::Base
  extend SimpleCalendar
  has_calendar

  has_and_belongs_to_many :users, join_table: 'users_events'
  validates :name, presence: true
  validates :location, presence: true
  validates :starts_at, presence: true
  validates :end, presence: true
  scope :upcoming, lambda { where("starts_at > ?", DateTime.now) }

  def date
    time = self.starts_at.to_formatted_s(:long_ordinal).split(" ")
    time[0] + " " + time[1] + " " + time[2]
  end

  def time
    time1 = self.starts_at.to_formatted_s(:long_ordinal).split(" ")
    time2 = self.end.to_formatted_s(:long_ordinal).split(" ")
    time1[3] + " - " + time2[3]
  end
end

#rails g scaffold name alekfn:string
#rails

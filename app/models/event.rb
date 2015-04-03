class Event < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: 'users_events'
  validates :name, presence: true
  validates :location, presence: true
  validates :start, presence: true
  validates :end, presence: true
  scope :upcoming, lambda { where("start > ?", DateTime.now) }

  def date
    time = self.start.to_formatted_s(:long_ordinal).split(" ")
    time[0] + " " + time[1] + " " + time[2]
  end

  def time
    time1 = self.start.to_formatted_s(:long_ordinal).split(" ")
    time2 = self.end.to_formatted_s(:long_ordinal).split(" ")
    time1[3] + " - " + time2[3]
  end
end

#rails g scaffold name alekfn:string
#rails

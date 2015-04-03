class Event < ActiveRecord::Base
  def date
  time = self.start.to_formatted_s(:long_ordinal).split(" ")
  time[0] + " " + time[1] + " " + time[2]
  end
end

#rails g scaffold name alekfn:string
#rails

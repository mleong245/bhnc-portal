Given /it is the week of (.+)/ do |date|
  Timecop.freeze DateTime.parse(date)
end

Then /(.+) from (.+) to (.+) should (|not )be highlighted on the calendar for "(.+)"/ do |date, start_time, end_time, highlite, location|
  step %Q{I follow "#{location}"}
  day = date.split('-')[1].to_i
  diff = day - Time.now.day
  highlited = find("##{location} .wday-#{diff} table", :text => start_time).has_css?(".highlite")
  if highlite != 'not '
    expect(highlited).to be_true
  else
    expect(highlited).to be_false
  end
end

Given /I have submitted a request for "(.+)" on (.+) from (.+) to (.+)/ do |location, day, start_time, end_time|
  step %Q{I am on the space rental requests page}
  step %Q{I request "#{location}" on #{day} from #{start_time} to #{end_time}}
end

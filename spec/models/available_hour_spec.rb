require 'spec_helper'

describe AvailableHour do
  it "lists the days" do
    days = AvailableHour.days
    expect(days).to eq(["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"])
  end

  it "lists of times" do
    times = AvailableHour.start_times
    expect(times).to eq(["8:00AM", "8:30AM", "9:00AM", "9:30AM", "10:00AM", "10:30AM", "11:00AM", "11:30AM",
     "12:00PM", "12:30PM", "1:00PM", "1:30PM", "2:00PM", "2:30PM", "3:00PM", "3:30PM",
     "4:00PM", "4:30PM", "5:00PM", "5:30PM"])
   end
end

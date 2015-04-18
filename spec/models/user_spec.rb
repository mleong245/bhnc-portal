require 'spec_helper'

describe User do
  it "should not allow a blank email" do
    user = User.new({:first_name => 'foo', :last_name => 'bar', :password => '12345678'})
    expect(user.save).to be_false
  end

  it "says if a user is available" do
    @user = User.create(:first_name => "First", :last_name => "Last", :email => "email@email.com", :password => "12345678")
    @hour = AvailableHour.create(:day_of_week => "Sunday", :start => "8:00AM", :end => "8:30AM")
    @user.available_hours << @hour
    expect(@user.available?("Sunday", "8:00AM")).to be_true
  end

  it "says if a user is not available" do
    @user = User.create(:first_name => "First", :last_name => "Last", :email => "email@email.com", :password => "12345678")
    @hour = AvailableHour.create(:day_of_week => "Sunday", :start => "8:00AM", :end => "8:30AM")
    expect(@user.available?("Sunday", "8:00AM")).to be_false
  end
end

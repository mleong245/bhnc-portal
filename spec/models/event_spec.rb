require 'spec_helper'

describe Event do
  it "should not allow a blank name" do
    event = Event.new({:location => 'bar', :starts_at => 'March 31st 2015 8:00', :end => 'March 31st 2015 9:00'})
    expect(event.save).to be_false
  end

  it "should not allow a blank location" do
    event = Event.new({:name => 'bar', :starts_at => 'March 31st 2015 8:00', :end => 'March 31st 2015 9:00'})
    expect(event.save).to be_false
  end

  it "should not allow a blank starts_at or end" do
    event = Event.new({:name => 'bar', :location => 'foo', :end => 'March 31st 2015 9:00'})
    expect(event.save).to be_false
    event = Event.new({:location => 'bar', :starts_at => 'March 31st 2015 8:00', :name => 'foo'})
    expect(event.save).to be_false
  end

  describe '.upcoming' do
    it "should not show past events" do
      Timecop.freeze DateTime.parse("March 31st 2015")
      event = Event.create({:name => 'foo', :location => 'bar', :starts_at => 'March 30th 2015 8:00', :end => 'March 31st 2015 9:00'})
      expect(Event.upcoming.include?(event)).to be_false
    end

    it "should show upcoming events" do
      Timecop.freeze DateTime.parse("March 30th 2015")
      event = Event.create({:name => 'foo', :location => 'bar', :starts_at => 'March 31st 2015 8:00', :end => 'March 31st 2015 9:00'})
      expect(Event.upcoming.include?(event)).to be_true
    end
  end

  describe '.date' do
    it "should return correct string" do
      event = Event.new({:name => 'bar', :location => 'foo', :starts_at => 'March 31st 2015 8:00', :end => 'March 31st 2015 9:00'})
      expect(event.date().include?("March 31st, 2015")).to be_true
    end
  end

  describe '.time' do
    it "should return correct string" do
      event = Event.new({:name => 'bar', :location => 'foo', :starts_at => 'March 31st 2015 8:00', :end => 'March 31st 2015 9:00'})
      expect(event.time().include?("08:00 - 09:00")).to be_true
    end
  end
end

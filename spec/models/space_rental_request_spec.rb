require 'spec_helper'

describe SpaceRentalRequest do
  it 'should not be approved when created' do
    request = SpaceRentalRequest.new
    expect(request.approved?).to be_false
  end
  it 'should know when it conflicts with an approved request' do
    approved_request = SpaceRentalRequest.create(:location => 'something', :start => DateTime.new(2015, 1, 1), :end => DateTime.new(2015, 1, 2), :approved => true)
    new_request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1, 1), :end => DateTime.new(2015, 1, 3))
    expect(new_request.has_conflict).to be_true
  end
  it 'should know when it does not conflict with any approved requests' do
    approved_request = SpaceRentalRequest.create(:location => 'something', :start => DateTime.new(2015, 1, 1), :end => DateTime.new(2015, 1, 2), :approved => true)
    new_request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 3), :end => DateTime.new(2015, 1, 4))
    expect(new_request.has_conflict).to be_false
  end
  it 'should not have a conflict with an unapproved request' do
    approved_request = SpaceRentalRequest.create(:location => 'something', :start => DateTime.new(2015, 1, 1), :end => DateTime.new(2015, 1, 2))
    new_request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1, 1), :end => DateTime.new(2015, 1, 3))
    expect(new_request.has_conflict).to be_false
  end
  it 'should not conflict with an approved request in a different location' do
    approved_request = SpaceRentalRequest.create(:location => 'something', :start => DateTime.new(2015, 1, 1), :end => DateTime.new(2015, 1, 2), :approved => true)
    new_request = SpaceRentalRequest.new(:location => 'something_else', :start => DateTime.new(2015, 1, 1, 1), :end => DateTime.new(2015, 1, 3))
    expect(new_request.has_conflict).to be_false
  end
  it 'should not have the start time come before the end time' do
    request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1), :end => DateTime.new(2014, 1, 1))
    expect(request.valid?).to be_false
  end
  it 'should give the same time for start and starts_at' do
    request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1), :end => DateTime.new(2014, 1, 1))
    expect(request.starts_at).to eq(request.start)
  end
  it 'should know when to display the user name in the calendar' do
    request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1, 1, 15), :end => DateTime.new(2014, 1, 1, 2))
    user = User.new()
    request.user = user
    time = DateTime.new(2015, 1, 1, 1)
    expect(request.display_name?(time)).to be_true
  end
  it 'should not display the user name when the time is wrong' do
    request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1, 1, 15), :end => DateTime.new(2014, 1, 1, 2))
    user = User.new()
    request.user = user
    time = DateTime.new(2015, 1, 1)
    expect(request.display_name?(time)).to be_false
  end
  it 'should not display the user name when there is no user' do
    request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1, 1, 15), :end => DateTime.new(2015, 1, 1, 2))
    time = DateTime.new(2015, 1, 1, 1)
    expect(request.display_name?(time)).to be_false
  end
  it 'should know when to highlight a time' do
    request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1, 1, 15), :end => DateTime.new(2015, 1, 1, 2))
    time = DateTime.new(2015, 1, 1, 1)
    user = User.new()
    request.user = user
    expect(SpaceRentalRequest.highlight?([request], time)).to be_true
  end
  it 'should not highlight a time when no rental is scheduled' do
    request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1, 1, 15), :end => DateTime.new(2015, 1, 1, 2))
    time = DateTime.new(2015, 1, 1, 2)
    user = User.new()
    request.user = user
    expect(SpaceRentalRequest.highlight?([request], time)).to be_false
  end
  it 'should give the first name and last initial of its user to display' do
    request = SpaceRentalRequest.new(:location => 'something', :start => DateTime.new(2015, 1, 1, 1, 15), :end => DateTime.new(2015, 1, 1, 2))
    user = User.new(:first_name => 'First', :last_name => 'Last')
    request.user = user
    expect(request.first_and_last_initial).to eq('First L')
  end
  it 'should display the time in a readable format' do
    request = SpaceRentalRequest.new(:start => DateTime.new(2015, 1, 2, 3, 4, 5, '-7'))
    expect(request.display_time(request.start)).to eq('01/02/2015  2:04 AM')
  end
end

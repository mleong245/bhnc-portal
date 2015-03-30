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
end

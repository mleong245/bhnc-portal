require 'spec_helper'

describe "space_rental_requests/index" do
  before(:each) do
    assign(:space_rental_requests, [
      stub_model(SpaceRentalRequest,
        :location => "Location",
        :start => DateTime.now,
        :end => DateTime.now
      ),
      stub_model(SpaceRentalRequest,
        :location => "Location",
        :start => DateTime.now,
        :end => DateTime.now
      )
    ])
  end

  it "renders a list of space_rental_requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end

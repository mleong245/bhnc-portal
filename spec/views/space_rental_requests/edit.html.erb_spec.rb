require 'spec_helper'

describe "space_rental_requests/edit" do
  before(:each) do
    @space_rental_request = assign(:space_rental_request, stub_model(SpaceRentalRequest,
      :location => "MyString"
    ))
  end

  it "renders the edit space_rental_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", space_rental_request_path(@space_rental_request), "post" do
      assert_select "input#space_rental_request_location[name=?]", "space_rental_request[location]"
    end
  end
end

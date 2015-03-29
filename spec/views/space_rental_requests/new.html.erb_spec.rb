require 'spec_helper'

describe "space_rental_requests/new" do
  before(:each) do
    assign(:space_rental_request, stub_model(SpaceRentalRequest,
      :location => "MyString"
    ).as_new_record)
  end

  it "renders new space_rental_request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", space_rental_requests_path, "post" do
      assert_select "input#space_rental_request_location[name=?]", "space_rental_request[location]"
    end
  end
end

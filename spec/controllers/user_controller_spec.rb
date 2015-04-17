require 'spec_helper'

describe UserController do
  before do
    @user = User.create(:first_name => "First", :last_name => "Last", :email => "email@email.com", :password => "12345678")
    @event = Event.create({:name => 'bar', :location => 'foo', :starts_at => 'March 31st 2015 8:00', :end => 'March 31st 2015 9:00'})
    sign_in @user
    Timecop.freeze DateTime.parse("March 30th 2015")
  end

  describe "GET show" do
    it "renders the user landing page" do
      get :show, :id => @user.id
      expect(response).to render_template("show")
    end

    it "assigns @events" do
      get :show, :id => @user.id
      expect(assigns(:events)).to eq([@event])
    end
  end
end

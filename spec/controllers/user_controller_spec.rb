require 'spec_helper'

describe UserController do
  before do
    @user = User.create(:first_name => "First", :last_name => "Last", :email => "email@email.com", :password => "12345678")
    @event = Event.create({:name => 'bar', :location => 'foo', :start => 'March 31st 2015 8:00', :end => 'March 31st 2015 9:00'})
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

  describe "GET volunteer" do
    it "renders the Volunteer register page" do
      get :volunteer, :id => @user.id
      expect(response).to render_template("volunteer")
    end
  end

  describe "Valid POST newVolunteer" do
    before do
      post :newVolunteer, :id => @user.id, :volunteer => {:street_address => "2020 Kittredege Street",
                                                          :city => "Berkeley",
                                                          :zip_code => "95843",
                                                          :phone => "9168357434",
                                                          :company => "Blah"}
    end

    it "assigns @user" do
      expect(assigns(:user)).to eq(@user)
    end

    it "assigns @valid" do
      expect(assigns(:valid)).to eq(true)
    end

    it "assigns flash[:notice]" do
      expect(flash[:notice]).to eq("Successfully signed up!")
    end

    it "redirects to landing" do
      expect(response).to redirect_to('/')
    end
  end

  describe "Invalid POST newVolunteer" do
    before do
      post :newVolunteer, :id => @user.id, :volunteer => {:street_address => "2020 Kittredege Street",
                                                          :city => "Berkeley",
                                                          :zip_code => "95843",
                                                          :phone => "916",
                                                          :company => "Blah"}
    end

    it "assigns @user" do
      expect(assigns(:user)).to eq(@user)
    end

    it "assigns @valid" do
      expect(assigns(:valid)).to eq(false)
    end

    it "assigns flash[:notice]" do
      expect(flash[:alert]).to eq("Please check the format of your address and phone number")
    end

    it "redirects to landing" do
      expect(response).to redirect_to(user_new_volunteer_path)
    end
  end
end

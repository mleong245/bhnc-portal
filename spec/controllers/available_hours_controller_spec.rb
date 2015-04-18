require 'spec_helper'

describe AvailableHoursController do
  before do
    @user = User.create(:first_name => "First", :last_name => "Last", :email => "email@email.com", :password => "12345678")
    @event = Event.create({:name => 'bar', :location => 'foo', :starts_at => 'March 31st 2015 8:00', :end => 'March 31st 2015 9:00'})
    sign_in @user
    @hour = AvailableHour.create(:day_of_week => "Sunday", :start => "8:00AM", :end => "8:30AM")
    @hour2 = AvailableHour.create(:day_of_week => "Sunday", :start => "9:00AM", :end => "9:30AM")
  end

  describe "GET edit" do
    it "renders the edit available hours page" do
      get :edit
      expect(response).to render_template("edit")
    end
  end

  describe "POST update" do
    it "renders the user homepage" do
      post :update, :available_hours => {"Sunday, 8:00AM" => 0}
      expect(response).to redirect_to(user_path(@user))
    end

    it "sets new hours" do
      post :update, :available_hours => {"Sunday, 8:00AM" => 1}
      expect(@user.available_hours.include?(@hour)).to eq(true)
    end

    it "sets multiple hours" do
      post :update, :available_hours => {"Sunday, 8:00AM" => 1, "Sunday, 9:00AM" => 1}
      expect(@user.available_hours.include?(@hour)).to eq(true)
      expect(@user.available_hours.include?(@hour2)).to eq(true)
    end

    it "removes previous hours" do
      post :update, :available_hours => {"Sunday, 8:00AM" => 1, "Sunday, 9:00AM" => 1}
      post :update, :available_hours => {"Sunday, 8:00AM" => 0}
      expect(@user.available_hours).to eq([])
    end

    it "flashes success message" do
      post :update, :available_hours => {"Sunday, 8:00AM" => 1}
      expect(flash[:notice]).to eq("Successfully updated available hours!")
    end
  end
end

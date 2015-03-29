require 'spec_helper'

describe EventsController do
  before do
    @user = User.create(:first_name => "First", :last_name => "Last", :email => "email@email.com", :password => "12345678")
    @event = Event.create({:name => 'bar', :location => 'foo', :start => 'March 31st 2015 8:00', :end => 'March 31st 2015 9:00'})
    sign_in @user
  end

  describe "GET event_detail" do
    it "renders the event details template" do
      get :event_detail, :id => @event.id
      expect(response).to render_template("event_detail")
    end

    it "assigns @event" do
      get :event_detail, :id => @event.id
      expect(assigns(:event)).to eq(@event)
    end
  end

  describe "POST event_volunteer" do
    before do
      post :event_volunteer, :id => @event.id
    end

    it "redirects to the event detial page" do
      expect(response).to redirect_to(event_detail_path)
    end

    it "assigns @event" do
      expect(assigns(:event)).to eq(@event)
    end

    it "adds event to User's list of events" do
      expect(@user.events).to eq([@event])
    end

    it "adds user to Event's list of users" do
      expect(@event.users).to eq([@user])
    end
  end

  describe "POST event_unvolunteer" do
    before do
      post :event_volunteer, :id => @event.id
      post :event_unvolunteer, :id => @event.id
    end
    it "redirects to the event detial page" do
      expect(response).to redirect_to(event_detail_path)
    end

    it "assigns @event" do
      expect(assigns(:event)).to eq(@event)
    end

    it "removes event to User's list of events" do
      expect(@user.events).to eq([])
    end

    it "removes user to Event's list of users" do
      expect(@event.users).to eq([])
    end
  end
end

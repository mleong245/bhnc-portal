require "spec_helper"

describe VolunteerApplication do
  before do
    @user = User.new(:first_name => "First", :last_name => "Last", :email => "coolkid@email.com", :password => "12345678")
    @user.save
    User.stub(:find_by_id).and_return(@user)
    @volunteer_app = VolunteerApplication.new(user_id: @user.id, name: 'Foo',
      street_address: '2020 Kittredge Street', city: 'Berkeley', zip_code: '95843',
      phone: '9168357434', company: 'Cool', approved: true)
    @volunteer_app.volunteer_status
  end

  describe "volunteer status" do
    it "sets user as volunteer" do
      User.find(@user.id).volunteer.should be_true
    end

    it "emails the user" do
      email = ActionMailer::Base.deliveries.last
      email.subject.should include("volunteer")
    end
  end

  describe "volunteer denied" do
    it "emails the user" do
      @volunteer_app.volunteer_denied
      email = ActionMailer::Base.deliveries.last
      email.subject.should include("volunteer")
    end
  end
end

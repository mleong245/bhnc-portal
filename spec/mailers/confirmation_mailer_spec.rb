require "spec_helper"

describe ConfirmationMailer do
  describe "rental approved" do
    before(:each) do
      @user = User.new(email: "foo@gmail.com")
      ConfirmationMailer.rental_approved(@user).deliver
      @email = ActionMailer::Base.deliveries.last
    end
    it "Sends from correct sender" do
      @email.from.should == ["bhncportal@gmail.com"]
    end
    it "Sends to correct user" do
      @email.to.should == [@user.email]
    end
    it "Sends correct message" do
      @email.subject.should include('You rental request has been approved!')
    end
  end

  describe "rental denied" do
    before(:each) do
      @user = User.new(email: "foo@gmail.com")
      ConfirmationMailer.rental_denied(@user).deliver
      @email = ActionMailer::Base.deliveries.last
    end
    it "Sends from correct sender" do
      @email.from.should == ["bhncportal@gmail.com"]
    end
    it "Sends to correct user" do
      @email.to.should == [@user.email]
    end
    it "Sends correct message" do
      @email.subject.should include('Your rental request has been denied')
    end
  end

  describe "user created" do
    before(:each) do
      @user = User.new(email: "foo@gmail.com")
      ConfirmationMailer.user_created(@user).deliver
      @email = ActionMailer::Base.deliveries.last
    end
    it "Sends from correct sender" do
      @email.from.should == ["bhncportal@gmail.com"]
    end
    it "Sends to correct user" do
      @email.to.should == [@user.email]
    end
    it "Sends correct message" do
      @email.subject.should include('Welcome to BHNC!')
    end
  end

  describe "volunteer approved" do
    before(:each) do
      @user = User.new(email: "foo@gmail.com")
      ConfirmationMailer.volunteer_approved(@user).deliver
      @email = ActionMailer::Base.deliveries.last
    end
    it "Sends from correct sender" do
      @email.from.should == ["bhncportal@gmail.com"]
    end
    it "Sends to correct user" do
      @email.to.should == [@user.email]
    end
    it "Sends correct message" do
      @email.subject.should include('You have been approved as a volunteer!')
    end
  end

  describe "volunteer denied" do
    before(:each) do
      @user = User.new(email: "foo@gmail.com")
      ConfirmationMailer.volunteer_denied(@user).deliver
      @email = ActionMailer::Base.deliveries.last
    end
    it "Sends from correct sender" do
      @email.from.should == ["bhncportal@gmail.com"]
    end
    it "Sends to correct user" do
      @email.to.should == [@user.email]
    end
    it "Sends correct message" do
      @email.subject.should include('Your volunteer application has been denied')
    end
  end

end

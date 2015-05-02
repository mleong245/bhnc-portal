Given /a user is signed up/ do
  @user = User.create({:email => 'email@gmail.com', :password => '12345678', :first_name => 'Foo', :last_name => 'Bar'})
end

Given /a user has applied to volunteer/ do
  @volunteer_app = VolunteerApplication.create(user_id: @user.id, name: 'Foo',
    street_address: '2020 Kittredge Street', city: 'Berkeley', zip_code: '95843', phone: '9168357434', company: 'Cool')
end

Given /a user has applied to rent a space/ do
  @request = @user.space_rental_requests.create(:location => "location", :start => Time.now + 10.hours, :end => Time.now + 12.hours)
end

When /a user is (accepted|denied?) as a confirmed volunteer/ do |accepted|
  if accepted == "accepted"
    @volunteer_app.update_attributes(approved: true)
  else
    @volunteer_app.destroy
  end
end

When /a user's rental space request is (accepted|denied?)/ do |accepted|
  if accepted == "accepted"
    @request.update_attributes(approved: true)
  else
    @request.destroy
  end
end

Then /the user should have received a "(.*)" email/ do |subject|
  # this will get the first email, so we can check the email headers and body.
  email = ActionMailer::Base.deliveries.last
  email.from.should == ["bhncportal@gmail.com"]
  email.to.should == [@user.email]
  email.subject.should include(subject)
end

require 'spec_helper'

describe User do
  it "should not allow a blank email" do
    user = User.new({:first_name => 'foo', :last_name => 'bar', :password => '12345678'})
    expect(user.save).to be_false
  end
  it "should not allow a blank first name" do
    user = User.new({:email => 'foo@gmail.com', :last_name => 'bar', :password => '12345678'})
    expect(user.save).to be_false
  end
  it "should not allow a blank last name" do
    user = User.new({:email => 'foo@gmail.com', :first_name => 'bar', :password => '12345678'})
    expect(user.save).to be_false
  end
end

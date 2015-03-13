require 'spec_helper'

describe User do
  it "should not allow a blank email" do
    user = User.new({:first_name => 'foo', :last_name => 'bar', :password => '12345678'})
    expect(user.save).to be_false
  end
end

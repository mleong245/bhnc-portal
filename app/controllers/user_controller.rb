class UserController < ApplicationController
  def show
    @events = Event.upcoming
  end

end

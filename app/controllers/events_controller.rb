# app/controllers/events_controller.rb
class EventsController < ApplicationController
  def index
    @events = Event.all
    p "*" * 80
    p "swag: #{@events}"
  end

  def event_detail
    @events = Event.find params[:id]
  end

#event_detail
#render 'user/show'
#render 'meh'
end
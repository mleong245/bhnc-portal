# app/controllers/events_controller.rb
class EventsController < ApplicationController
  def event_detail
    @event = Event.find params[:id]
  end

  def event_volunteer
    @event = Event.find params[:id]
    current_user.events << @event
    current_user.save
    flash[:notice] = "Successfully registered for #{@event.name}!"
    redirect_to event_detail_path
  end

  def event_unvolunteer
    @event = Event.find params[:id]
    current_user.events.delete(@event)
    @event.users.delete(current_user)
    current_user.save
    @event.save
    flash[:notice] = "Successfully unregistered for #{@event.name}!"
    redirect_to event_detail_path
  end

end

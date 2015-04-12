class UserController < ApplicationController
  def show
    @events = Event.upcoming
    @space_rental_locations = SpaceRentalRequest.allLocations
    @space_rental_requests = {}
    @space_rental_locations.each do |location|
        @space_rental_requests[location] = SpaceRentalRequest.where(:location => location)
    end
  end

  def volunteer

  end

  def newVolunteer
  	@user = current_user
    @valid = @user.update(volunteer_params)
    if @valid
  	   flash[:notice] = "Successfully signed up!"
       redirect_to '/'
     else
       flash[:alert] = "Please check the format of your address and phone number"
      redirect_to user_new_volunteer_path
    end
  end

  def myEvents

  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:street_address, :city, :zip_code,
                                      :phone, :company)
  end

end

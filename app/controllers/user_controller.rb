class UserController < ApplicationController
  def show
    @events = Event.all
  end

  def volunteer

  end

  def newVolunteer
  	@user = current_user
    @user.update(volunteer_params)
  	flash[:notice] = "Successfully signed up!"
  	redirect_to '/'
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:street_address, :city, :zip_code,
                                      :phone_number, :company)
  end

end

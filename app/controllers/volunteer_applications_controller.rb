class VolunteerApplicationsController < ApplicationController
  before_action :set_volunteer_application, only: [:show, :edit, :update, :destroy]

  def volunteer

  end

  def newVolunteer
    @application = VolunteerApplication.new
    @user = current_user
    @user.update(volunteer_params)
    app_info = volunteer_params.merge({:user_id => @user.id, :name => "#{@user.first_name} #{@user.last_name}"})
    @valid = @application.update(app_info)
    #@valid = @application.update(volunteer_params)
    if @valid
       flash[:notice] = "Successfully signed up!"
       redirect_to '/'
     else
       flash[:alert] = "Please check the format of your address and phone number"
      redirect_to user_new_volunteer_path
    end
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:street_address, :city, :zip_code,
                                      :phone, :company)
  end
end

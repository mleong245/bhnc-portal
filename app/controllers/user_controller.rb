class UserController < ApplicationController
  def show
    @events = Event.all
  end

  def volunteer

  end

  def newVolunteer
  	@user = current_user
    if params[:volunteer][:street_address].blank? or params[:volunteer][:city].blank? or params[:volunteer][:zip_code].blank? or params[:volunteer][:phone_number].blank? or params[:volunteer][:company].blank?
      flash[:notice] = "Must fill in every field."
      redirect_to '/'
    else
      @user.street_address = params[:volunteer][:street_address]
  	  @user.city = params[:volunteer][:city]
  	  @user.zip_code = params[:volunteer][:zip_code]
  	  @user.phone_number = params[:volunteer][:phone_number]
  	  @user.company = params[:volunteer][:company]
  	  @user.save
  	  flash[:notice] = "Sucessfully signed up!"
  	  redirect_to '/'
    end
  end

end
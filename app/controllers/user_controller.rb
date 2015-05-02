class UserController < ApplicationController
  def show
    @events = Event.upcoming.limit(15)
    @space_rental_locations = SpaceRentalRequest.allLocations
    @space_rental_requests = {}
    @space_rental_locations.each do |location|
        @space_rental_requests[location] = SpaceRentalRequest.where(:location => location, :approved => true)
    if params[:start_date]
      @theDate = params[:start_date]
      @date_display = Date::MONTHNAMES[session[:month].to_i].to_s + " " + session[:year]
    else
      @theDate = Time.now.to_s
      @date_display = Date::MONTHNAMES[Date.today.month].to_s + " " + Date.today.year.to_s
    end
  end

  def start_date
    #date = params[:calendar]["date(1i)"] + "-" + params[:calendar]["date(2i)"] + "-" + params[:calendar]["date(3i)"]
    date = params[:calendar]["date(1i)"] + "-" + params[:calendar]["date(2i)"] + "-" + "1"
    session[:month] = params[:calendar]["date(2i)"]
    session[:year] = params[:calendar]["date(1i)"]
    params[:the_date] = date
    redirect_to "/?start_date=#{date}"
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

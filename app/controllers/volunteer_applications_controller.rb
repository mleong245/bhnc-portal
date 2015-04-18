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

  # GET /volunteer_applications
  # GET /volunteer_applications.json
  def index
    @volunteer_applications = VolunteerApplication.all
  end

  # GET /volunteer_applications/1
  # GET /volunteer_applications/1.json
  def show
  end

  # GET /volunteer_applications/new
  def new
    @volunteer_application = VolunteerApplication.new
  end

  # GET /volunteer_applications/1/edit
  def edit
  end

  # POST /volunteer_applications
  # POST /volunteer_applications.json
  def create
    @volunteer_application = VolunteerApplication.new(volunteer_application_params)

    respond_to do |format|
      if @volunteer_application.save
        format.html { redirect_to @volunteer_application, notice: 'Volunteer application was successfully created.' }
        format.json { render :show, status: :created, location: @volunteer_application }
      else
        format.html { render :new }
        format.json { render json: @volunteer_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteer_applications/1
  # PATCH/PUT /volunteer_applications/1.json
  def update
    respond_to do |format|
      if @volunteer_application.update(volunteer_application_params)
        format.html { redirect_to @volunteer_application, notice: 'Volunteer application was successfully updated.' }
        format.json { render :show, status: :ok, location: @volunteer_application }
      else
        format.html { render :edit }
        format.json { render json: @volunteer_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteer_applications/1
  # DELETE /volunteer_applications/1.json
  def destroy
    @volunteer_application.destroy
    respond_to do |format|
      format.html { redirect_to volunteer_applications_url, notice: 'Volunteer application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer_application
      @volunteer_application = VolunteerApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_application_params
      params[:volunteer_application]
    end
end

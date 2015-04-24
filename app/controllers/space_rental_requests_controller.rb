class SpaceRentalRequestsController < ApplicationController
  before_action :set_space_rental_request, only: [:show, :edit, :update, :destroy]

  # GET /space_rental_requests
  # GET /space_rental_requests.json
  def index
    @space_rental_requests = SpaceRentalRequest.where(:user => current_user)
  end

  # GET /space_rental_requests/1
  # GET /space_rental_requests/1.json
  def show
    if SpaceRentalRequest.find(params[:id]).user != current_user
      redirect_to space_rental_requests_path
    end
  end

  # GET /space_rental_requests/new
  def new
    @space_rental_request = SpaceRentalRequest.new
  end

  # GET /space_rental_requests/1/edit
  def edit
  end

  # POST /space_rental_requests
  # POST /space_rental_requests.json
  def create
    @space_rental_request = SpaceRentalRequest.new(space_rental_request_params)
    @space_rental_request.user = current_user
    respond_to do |format|
      if @space_rental_request.has_conflict || !@space_rental_request.save
        show_errors(format, :new)
      else
        show_success(format, :created, 'Space rental request was successfully submitted. An email will be sent to you if the request is approved.')
      end
    end
  end

  # PATCH/PUT /space_rental_requests/1
  # PATCH/PUT /space_rental_requests/1.json
  def update
    respond_to do |format|
      if @space_rental_request.update(space_rental_request_params)
        show_success(format, :ok, 'Space rental request was successfully updated.')
      else
        show_errors(format, :edit)
      end
    end
  end

  # DELETE /space_rental_requests/1
  # DELETE /space_rental_requests/1.json
  def destroy
    @space_rental_request.destroy
    respond_to do |format|
      format.html { redirect_to space_rental_requests_url, notice: 'Space rental request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_rental_request
      @space_rental_request = SpaceRentalRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_rental_request_params
      params.require(:space_rental_request).permit(:location, :start, :end, :description)
    end
    
    def show_success(format, status_message, notice_message)
        format.html { redirect_to @space_rental_request, notice: notice_message }
        format.json { render :show, status: status_message, location: @space_rental_request }
    end
    
    def show_errors(format, page)
        format.html { render page }
        format.json { render json: @space_rental_request.errors, status: :unprocessable_entity }
    end
end

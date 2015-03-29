class SpaceRentalRequestsController < ApplicationController
  before_action :set_space_rental_request, only: [:show, :edit, :update, :destroy]

  # GET /space_rental_requests
  # GET /space_rental_requests.json
  def index
    @space_rental_requests = SpaceRentalRequest.all
  end

  # GET /space_rental_requests/1
  # GET /space_rental_requests/1.json
  def show
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

    respond_to do |format|
      if @space_rental_request.save
        format.html { redirect_to @space_rental_request, notice: 'Space rental request was successfully submitted' }
        format.json { render :show, status: :created, location: @space_rental_request }
      else
        format.html { render :new }
        format.json { render json: @space_rental_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /space_rental_requests/1
  # PATCH/PUT /space_rental_requests/1.json
  def update
    respond_to do |format|
      if @space_rental_request.update(space_rental_request_params)
        format.html { redirect_to @space_rental_request, notice: 'Space rental request was successfully updated.' }
        format.json { render :show, status: :ok, location: @space_rental_request }
      else
        format.html { render :edit }
        format.json { render json: @space_rental_request.errors, status: :unprocessable_entity }
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
      params.require(:space_rental_request).permit(:location, :start, :end)
    end
end

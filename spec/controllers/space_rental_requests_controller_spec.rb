require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SpaceRentalRequestsController do

  # This should return the minimal set of attributes required to create a valid
  # SpaceRentalRequest. As you add validations to SpaceRentalRequest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "location" => "MyString", "start" => DateTime.new(2015, 1, 1), "end" => DateTime.new(2015, 1, 2)} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpaceRentalRequestsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @user = User.create(:email => 'foo@gmail.com', :password => '12345678')
    sign_in :user, @user
  end

  describe "GET index" do
    it "assigns all space_rental_requests as @space_rental_requests" do
      space_rental_request = SpaceRentalRequest.create! valid_attributes
      get :index, {}, valid_session
      assigns(:space_rental_requests).should eq([space_rental_request])
    end
  end

  describe "GET show" do
    it "assigns the requested space_rental_request as @space_rental_request" do
      space_rental_request = SpaceRentalRequest.create! valid_attributes
      get :show, {:id => space_rental_request.to_param}, valid_session
      assigns(:space_rental_request).should eq(space_rental_request)
    end
  end

  describe "GET new" do
    it "assigns a new space_rental_request as @space_rental_request" do
      get :new, {}, valid_session
      assigns(:space_rental_request).should be_a_new(SpaceRentalRequest)
    end
  end

  describe "GET edit" do
    it "assigns the requested space_rental_request as @space_rental_request" do
      space_rental_request = SpaceRentalRequest.create! valid_attributes
      get :edit, {:id => space_rental_request.to_param}, valid_session
      assigns(:space_rental_request).should eq(space_rental_request)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SpaceRentalRequest" do
        expect {
          post :create, {:space_rental_request => valid_attributes}, valid_session
        }.to change(SpaceRentalRequest, :count).by(1)
      end

      it "assigns a newly created space_rental_request as @space_rental_request" do
        post :create, {:space_rental_request => valid_attributes}, valid_session
        assigns(:space_rental_request).should be_a(SpaceRentalRequest)
        assigns(:space_rental_request).should be_persisted
      end

      it "redirects to the created space_rental_request" do
        post :create, {:space_rental_request => valid_attributes}, valid_session
        response.should redirect_to(SpaceRentalRequest.last)
      end
    end

    describe "with invalid params" do
      it 'does not not save a space_rental_request with a conflict' do
        SpaceRentalRequest.any_instance.stub(:has_conflict).and_return(true)
        expect{
          post :create, {:space_rental_request => valid_attributes}, valid_session
        }.to change(SpaceRentalRequest, :count).by(0)
      end
      
      it "assigns a newly created but unsaved space_rental_request as @space_rental_request" do
        # Trigger the behavior that occurs when invalid params are submitted
        SpaceRentalRequest.any_instance.stub(:save).and_return(false)
        post :create, {:space_rental_request => { "location" => "invalid value" }}, valid_session
        assigns(:space_rental_request).should be_a_new(SpaceRentalRequest)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SpaceRentalRequest.any_instance.stub(:save).and_return(false)
        post :create, {:space_rental_request => { "location" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested space_rental_request" do
        space_rental_request = SpaceRentalRequest.create! valid_attributes
        # Assuming there are no other space_rental_requests in the database, this
        # specifies that the SpaceRentalRequest created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SpaceRentalRequest.any_instance.should_receive(:update).with({ "location" => "MyString" })
        put :update, {:id => space_rental_request.to_param, :space_rental_request => { "location" => "MyString" }}, valid_session
      end

      it "assigns the requested space_rental_request as @space_rental_request" do
        space_rental_request = SpaceRentalRequest.create! valid_attributes
        put :update, {:id => space_rental_request.to_param, :space_rental_request => valid_attributes}, valid_session
        assigns(:space_rental_request).should eq(space_rental_request)
      end

      it "redirects to the space_rental_request" do
        space_rental_request = SpaceRentalRequest.create! valid_attributes
        put :update, {:id => space_rental_request.to_param, :space_rental_request => valid_attributes}, valid_session
        response.should redirect_to(space_rental_request)
      end
    end

    describe "with invalid params" do
      it "assigns the space_rental_request as @space_rental_request" do
        space_rental_request = SpaceRentalRequest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SpaceRentalRequest.any_instance.stub(:save).and_return(false)
        put :update, {:id => space_rental_request.to_param, :space_rental_request => { "location" => "invalid value" }}, valid_session
        assigns(:space_rental_request).should eq(space_rental_request)
      end

      it "re-renders the 'edit' template" do
        space_rental_request = SpaceRentalRequest.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SpaceRentalRequest.any_instance.stub(:save).and_return(false)
        put :update, {:id => space_rental_request.to_param, :space_rental_request => { "location" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested space_rental_request" do
      space_rental_request = SpaceRentalRequest.create! valid_attributes
      expect {
        delete :destroy, {:id => space_rental_request.to_param}, valid_session
      }.to change(SpaceRentalRequest, :count).by(-1)
    end

    it "redirects to the space_rental_requests list" do
      space_rental_request = SpaceRentalRequest.create! valid_attributes
      delete :destroy, {:id => space_rental_request.to_param}, valid_session
      response.should redirect_to(space_rental_requests_url)
    end
  end

end

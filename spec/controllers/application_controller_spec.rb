describe ApplicationController do
  controller do
    def after_sign_out_path_for(resource)
        super resource
    end
  end

  before (:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "After sign out" do
    it "redirects to the /user/sign_in page" do
        controller.after_sign_out_path_for(@user).should == user_session_path
    end
  end

end
require "rails_helper"

RSpec.describe ListController do
  describe "GET index" do
    it "redirects when user is not authenticated" do
      get :index
      assert_redirected_to new_user_session_path
    end

    it "is ok when user is authenticated" do
      sign_in
      get :index
      assert_response 200
    end

    it "gets lists belonging to authenticated user" do
      user = create(:user)
      
      allow(controller).to receive(:current_user).and_return(user)
      expect(user).to receive(:lists).and_return(nil)
      
      sign_in
      get :index
    
      expect(@controller.instance_variable_get(:@lists)).to be(nil)
    end
  end
end

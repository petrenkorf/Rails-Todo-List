require "rails_helper"

RSpec.describe ListController do
  let(:user) {double('Petris', :lists => [])}

  describe "GET index" do
    it "redirects when user is not authenticated" do
      get :index
      assert_redirected_to new_user_session_path
    end

    it "is ok when user is authenticated" do
      sign_in user
      get :index
      
      assert_response 200
    end

    it "gets lists belonging to authenticated user" do
      sign_in user
      get :index
    
      expect(controller.instance_variable_get(:@lists)).to eq([])
    end
  end

  describe "GET new" do
    it "redirects when user is not authenticated" do
      get :new
      assert_redirected_to new_user_session_path
    end

    it "is ok when user is authenticated" do
      sign_in user
      get :new
      
      assert_response 200
    end
  end
end

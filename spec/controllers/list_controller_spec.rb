require "rails_helper"

RSpec.describe ListController do
  describe "GET index" do
    it "redirects when user is not authenticated" do
      get :index
      assert_redirected_to new_user_session_path
    end

    it "is ok when user is authenticated" do
      user = double('Petris', :lists => [])
      
      sign_in user
      get :index
      
      assert_response 200
    end

    it "gets lists belonging to authenticated user" do
      user = double('Petris', :lists => [])

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
      user = double('Petris', :lists => [])
      
      sign_in user
      get :new
      
      assert_response 200
    end
  end
end

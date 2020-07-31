require "rails_helper"

RSpec.describe ListController do
  let(:user) {double('Petris', :lists => [])}

  describe "GET index" do
    it "is not authenticated" do
      get :index
      assert_redirected_to new_user_session_path
    end

    it "is authenticated" do
      sign_in user
      get :index
      
      assert_response 200
    end

    it "is authenticated" do
      sign_in user
      get :index
    
      expect(controller.instance_variable_get(:@lists)).to eq([])
    end
  end

  describe "GET new" do
    it "is not authenticated" do
      get :new
      assert_redirected_to new_user_session_path
    end

    it "is authenticated" do
      sign_in user
      get :new
      
      assert_response 200
    end
  end

  describe "POST create" do
    it "is not authenticated" do
      post :create
      assert_redirected_to new_user_session_path
    end
  end
end

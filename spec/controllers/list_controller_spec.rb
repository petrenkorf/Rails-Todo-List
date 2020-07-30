require "rails_helper"

RSpec.describe ListController do
  describe "GET index" do
    it "redirects when user is not authenticated" do
      get :index
      assert_redirected_to new_user_session_path
    end
  end
end

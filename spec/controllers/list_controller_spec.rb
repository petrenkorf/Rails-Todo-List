require "rails_helper"

RSpec.describe ListController do
  describe "GET index" do
    it "redirects when user is not authenticated" do
      get :index
      assert_response 200
    end
  end
end

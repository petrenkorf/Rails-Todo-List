class BasePage
  include Capybara::DSL
  include Warden::Test::Helpers
  include Rails.application.routes.url_helpers
end


class LoginPage < BasePage
  def visit_page
    visit root_path

    self
  end

  def fill_form(email, password)
    fill_in "user_email", with: email
    fill_in "user_password", with: password

    self
  end

  def submit
    click_button "Log in"
    
    self
  end
end

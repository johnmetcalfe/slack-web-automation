class LoginPage < GenericPage
  def visit
    @driver.get "#{TestData.url}/signin"
  end

  def send_team_name(team_name)
    @driver.find_element(id: "domain").send_keys(team_name)
    @driver.find_element(id: "submit_team_domain").click
  end

  def send_login_credentials(email, password)
    @driver.find_element(id: "email").send_keys(email)
    @driver.find_element(id: "password").send_keys(password)
  end

  def click_enter_button
    @driver.find_element(id: "signin_btn").click
  end
end

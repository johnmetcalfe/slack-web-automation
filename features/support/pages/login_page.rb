class LoginPage < GenericPage
  def visit
    @driver.get "https://slack.com/signin"
  end

  def sendTeamName(teamName)
    @driver.find_element(id: "domain").send_keys(teamName)
    @driver.find_element(id: "submit_team_domain").click
  end

  def sendLoginCredentials(email, password)
    @driver.find_element(id: "email").send_keys(email)
    @driver.find_element(id: "password").send_keys(password)
    @driver.find_element(id: "signin_btn").click
  end

end

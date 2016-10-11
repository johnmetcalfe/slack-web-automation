class LoginPage < GenericPage
  def visit
    @browser.get "#{TestData.url}/signin"
  end

  def sendTeamName(teamName)
    @browser.find_element(id: "domain").send_keys(teamName)
    @browser.find_element(id: "submit_team_domain").click
  end

  def sendLoginCredentials(email, password)
    @browser.find_element(id: "email").send_keys(email)
    @browser.find_element(id: "password").send_keys(password)
    @browser.find_element(id: "signin_btn").click
  end

end

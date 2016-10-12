class System

  def initialize(browser)
    @browser = browser
  end

  def account
    @account ||= AccountPage.new @browser
  end

  def login
    @slack ||= LoginPage.new @browser
  end

  def login_as(hash)
    login.logout
    login.visit
    login.send_login_credentials(hash[:email], hash[:password])
    login.click_enter_button
  end
end


@system.login_as email: "foo@foo.com", password: "pass123"

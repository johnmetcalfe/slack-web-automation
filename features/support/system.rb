class System

  def initialize(browser)
    @browser = browser
  end

  def account_page
    @account ||= AccountPage.new @browser
  end

  def login_page
    @login ||= LoginPage.new @browser
  end
end

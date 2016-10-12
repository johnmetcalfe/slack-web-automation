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
end

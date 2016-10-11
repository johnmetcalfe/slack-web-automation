class System

  def initialize(browser)
    @browser = browser
  end

  def account
    @account ||= SlackAccountPage.new @browser
  end
end

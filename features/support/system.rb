class System

  def initialize(browser)
    @browser = browser
  end

  def slack
    @slack ||= SlackAccountPage.new @browser
  end

  def loginSlack
    @slack ||= LoginPage.new @browser
  end
end

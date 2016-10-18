class GenericPage
include RSpec::Matchers
include Selenium::WebDriver

# TODO: Set default for browser
#@@window_number = 0

  def initialize(driver)
    @driver = []
    @driver << driver
  end

  def url(window_number = 0)
    @driver[window_number].current_url
  end

  def title(window_number = 0)
    @driver[window_number].title
  end

  def source(window_number = 0)
    @driver[window_number].page_source
  end

  def new_browser()
    new_window = Selenium::WebDriver.for :chrome
    @driver << new_window
    @driver[-1].manage().window().position = Point.new(980,45)
    login_page = LoginPage.new(@driver[-1])
    login_page.visit
    login_page.send_team_name('slack-web-automation2')
    login_page.send_login_credentials('slacktestrob@gmail.com','slackpass2')
    login_page.check_for_channel(-1, 'general')
  end

end

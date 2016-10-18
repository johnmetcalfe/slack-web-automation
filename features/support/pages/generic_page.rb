class GenericPage
include RSpec::Matchers
include Selenium::WebDriver
@@wait = Selenium::WebDriver::Wait.new(timeout: 20000)


  def initialize(driver)
    @driver = driver
  end

  def url
    @driver.current_url
  end

  def title
    @driver.title
  end

  def source
    @driver.page_source
  end

end

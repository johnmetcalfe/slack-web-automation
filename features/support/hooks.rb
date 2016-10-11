
# Setup
browser = Selenium::WebDriver.for :chrome
TestData.load

Before do
  @browser ||= browser
  @browser.manage.delete_all_cookies
  @system ||= System.new @browser
end

After do |scenario|

end

at_exit do
  browser.quit
end

browser = Selenium::WebDriver.for :chrome

Before do
  @browser = browser
  @browser.manage.delete_all_cookies
end

After do |scenario|


end

at_exit do
  browser.quit
end

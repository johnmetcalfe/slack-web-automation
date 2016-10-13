Given(/^I am logged in as a user and on the Account pages$/) do

  @system.account.visit
  @system.loginSlack.sendLoginCredentials("slacktestbob@gmail.com", TestData.password)

end

When(/^I enter a new username and click save$/) do
  @system.account.change_username_to('slacktestbob')
end

Then(/^It should be updated in the username section$/) do
  @system.account.assert_username_is('slacktestbob')
  @system.account.reset_username_to('testuser1')
end


When(/^I change my password$/) do
  @system.account.change_password
end

Then(/^The account password should be updated$/) do
  @system.account.assert_password_changed
end

When(/^I change my email address$/) do
  @system.account.change_email_to('slacktestpob@gmail.com')
end

Then(/^The email address for the account should be updated$/) do
  @system.account.assert_email_is('slacktestpob@gmail.com')
  @system.account.reset_email_to_default
end

When(/^I change the timezone$/) do
  @system.account.change_timezone_to("Europe/Amsterdam")
end

Then(/^The timezone should be updated$/) do
  @system.account.assert_timezone_is("Europe/Amsterdam")
  @system.account.change_timezone_to("Europe/London")
  @system.account.assert_timezone_is("Europe/London")
end

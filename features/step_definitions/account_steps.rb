Given(/^I am logged in as a user and on the Account pages$/) do
  @system.account_page.visit
  @system.login_page.send_login_credentials(TestData.users[0][:email], TestData.users[0][:password])
end

When(/^I enter a new username and click save$/) do
  @system.account_page.change_username_to(TestData.users[4][:username])
end

Then(/^It should be updated in the username section$/) do
  @system.account_page.assert_username_is(TestData.users[4][:username])
  @system.account_page.reset_username_to(TestData.users[0][:username])
end


When(/^I change my password$/) do
  @system.account_page.change_password
end

Then(/^The account password should be updated$/) do
  @system.account_page.assert_password_changed
end

When(/^I change my email address$/) do
  @system.account_page.change_email_to(TestData.users[4][:email])
end

Then(/^The email address for the account should be updated$/) do
  @system.account_page.assert_email_is(TestData.users[4][:email])
  @system.account_page.reset_email_to_default
end

When(/^I change the timezone$/) do
  @system.account_page.change_timezone_to(TestData.timezones[0])
end

Then(/^The timezone should be updated$/) do
  @system.account_page.assert_timezone_is(TestData.timezones[0])
  @system.account_page.change_timezone_to(TestData.timezones[1])
  @system.account_page.assert_timezone_is(TestData.timezones[1])
end

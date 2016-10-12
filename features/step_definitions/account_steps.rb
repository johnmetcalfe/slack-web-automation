Given(/^I am logged in as a user and on the Account pages$/) do
  @system.account.visit
  @system.login.send_login_credentials("slacktestbob@gmail.com", TestData.password)
  @system.login.click_enter_button
end

When(/^I click expand on username$/) do
  @system.account.expand_username
end

Then(/^I should be able to enter a new username and click save$/) do
  @system.account.change_username('slacktestbob')
end

Then(/^It should be updated in the username tab$/) do
  @system.account.expand_username
  @system.account.assert_username('slacktestbob')
  @system.account.reset_username
end

When(/^I click expand on password$/) do
  @system.account.expand_password
end

When(/^Type in my current password$/) do
  @system.account.type_current_pass
end

When(/^Type in a new password$/) do
  @system.account.type_new_pass

end

Then(/^the account password should be updated$/) do
  @system.account.assert_password_updated
end

When(/^I click expand on email address$/) do
  @system.account.expand_email
end
When(/^Type in my current password for email$/) do
  @system.account.email_pass
end

When(/^type in a new email address$/) do
  @system.account.new_email
  @system.account.sumbit_email
end

Then(/^the email address for the account should be updated$/) do
  @system.account.assert_email
  @system.account.expand_email
  @system.account.email_pass
  @system.account.old_email
end

When(/^I click expand on Timezone$/) do
  @system.account.expand_timezone_section
end

When(/^I choose a different timezone$/) do
  @system.account.set_timezone "Europe/Lisbon"
end

Then(/^the timeszone should be updated$/) do
  @system.account.assert_timezone "Europe/Lisbon"
  @system.account.set_timezone "Europe/London" # Reset to default
end



Then(/^something$/) do
  @user1 = TestData.users[0]
  @user2 = TestData.users[1]
end

Then(/^something$/) do
  @system.login_as @user1
  @system.sidebar.select_channel "#general"
  @system.messages.send_message "Hello"
end

Then(/^something$/) do
  @system.login_as @user2
  @system.sidebar.select_channel "#general"
  @system.messages.assert_message_visible "Hello"
  @system.messages.assert_message_is_from @user1[:username]
end

Then(/^something$/) do

end

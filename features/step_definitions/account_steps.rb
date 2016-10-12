Given(/^I am logged in as a user and on the Account pages$/) do

  @system.account.visit
  @system.loginSlack.sendLoginCredentials("slacktestbob@gmail.com", TestData.password)


end

When(/^I click expand on username$/) do
  @system.account.expand_username
end

Then(/^I should be able to enter a new username and click save$/) do
  @system.account.change_username('testuser')
end

Then(/^It should be updated in the username tab$/) do
  @system.account.expand_username
  @system.account.assert_username
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
  @system.account.assert_password
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
  @system.account.expand_timezone
end

When(/^I open the drop down menu$/) do
  @system.account.open_dropdown
end

When(/^I select a different timezone$/) do
  @system.account.select_timezone
end

Then(/^the timeszone should be updated$/) do
  @system.account.assert_timezone
end

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
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click expand on email address$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^type in a new email address$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the email address for the account should be updated$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click expand on Timezone$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I open the drop down menu$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I select a different timezone$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the timeszone should be updated$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

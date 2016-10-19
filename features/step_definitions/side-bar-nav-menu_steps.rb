Given(/^I am logged in and on the messaging window$/) do
  @system.login_page.visit
  @system.login_page.send_login_credentials(TestData.users[1][:email], TestData.users[1][:password])
  @system.login_page.check_for_channel('general')
end

When(/^I navigate to profile and account$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^A sidebar should be shown$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I navigate to preferences$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be taken to the preferences page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I set myself to away$/) do
  @system.sidebar_section.toggle_away('away')
end

Then(/^My account should be away$/) do
  @system.sidebar_section.assert_away
  @system.sidebar_section.toggle_away('active')
end

When(/^I naviagte to Help and Feedback$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be taken to the help page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click invite people$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be taken to the page to invite people$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

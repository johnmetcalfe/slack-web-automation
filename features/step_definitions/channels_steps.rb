Given(/^I am logged in and on the channels window$/) do
  @system.channels_section.visit
  @system.login_page.send_login_credentials(TestData.users[1][:email], TestData.users[1][:password])
  binding.pry
end

When(/^I search for a channel$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^It should be displayed on the page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am logged in and on the messaging page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I create a private channel$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^It should appear in my list of channels$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I create a public channel$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I sort the channels by creation date$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^They should be listed in date order$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I open archived channels$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see the archived channels$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am logged in and on general channel$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I pick a different channel$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The channel should open$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I open about channels$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should be redirected back to the messaging page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Be shown an alert box$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I receive a message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The channel name should change to white$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I change the purpose of the channel$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^It should be updated at the top of the page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

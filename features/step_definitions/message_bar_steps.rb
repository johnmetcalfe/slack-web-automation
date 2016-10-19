Given(/^I am logged in$/) do
  @system.login_page.visit
  @system.login_page.send_login_credentials(TestData.users[2][:email], TestData.users[2][:password])
  @system.login_page.check_for_channel(0, 'general')
end

Given(/^i have a conversation open$/) do
  @system.direct_messages_section.start_direct_message(TestData.users[3][:username])
end

When(/^i send a message$/) do
  @system.message_bar_section.send_message
end

Then(/^the message should appear as successfully sent$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i send an emoji$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the emoji should appear as successfully sent$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i send a file$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the file should appear as being successfully sent$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i send a code snippet$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the snippet should appear as being successfully sent$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i send a post$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^i have the general channel open$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i send a giphy$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the giphy should appear as being successfully sent on general$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i send a @here$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the @here message should appear as being successfully sent on general$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^all members receive a notification$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i send a @channel$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the @channel message should appear as being successfully sent on general$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

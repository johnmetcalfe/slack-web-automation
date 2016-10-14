Given(/^i am logged in$/) do
  @system.login_page.visit
  @system.login_page.send_login_credentials('slacktestgerrard@gmail.com', 'slackpass')
  @system.login_page.check_for_channel('general')
end

Given(/^i have at least one direct message conversation$/) do
  @system.direct_messages_section.check_for_direct_message_conversation
end

When(/^i search for a conversation$/) do
  @system.direct_messages_section.search_for_conversation
end

Then(/^i should see the conversation available$/) do
  @system.direct_messages_section.see_conversation
end

When(/^i start a direct message with a single person$/) do
  @system.direct_messages_section.start_direct_message_single
end

Then(/^i should see the direct message window with a single recipient$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i start a direct message with multiple people$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^i should see the direct message window with multiple recipients$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^currently in a direct message conversation$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i select a different conversation$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^i should see the newly selected direct message window$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i receive a direct message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^i should see a notification next to the direct message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

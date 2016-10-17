Given(/^i am logged in$/) do
  @system.login_page.visit
  @system.login_page.send_login_credentials('slacktestgerrard@gmail.com', 'slackpass')
  @system.login_page.check_for_channel('general')
end

When(/^i start a direct message with a single person$/) do
  @system.direct_messages_section.start_direct_message("slacktestuser3")
end

Then(/^i should see the direct message window with a single recipient$/) do
  @system.direct_messages_section.assert_single_recipient
end

When(/^i start a direct message with multiple people$/) do
  @system.direct_messages_section.start_direct_message("slacktestuser3", "slacktestbob", "slacktestrob")
end

Then(/^i should see the direct message window with multiple recipients$/) do
  @system.direct_messages_section.assert_multiple_recipient
end

Given(/^currently in a direct message conversation$/) do
  @system.direct_messages_section.check_entered_conversation
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

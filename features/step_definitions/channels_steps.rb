Given(/^I am logged in and on the channels window$/) do
  @system.login_page.visit
  @system.login_page.send_login_credentials(TestData.users[1][:email], TestData.users[1][:password])
  @system.login_page.check_for_channel('general')
  @system.channels_section.open_channels
end

When(/^I search for a channel$/) do
  @system.channels_section.search_for(TestData.channel_search)
end

Then(/^It should be displayed on the page$/) do
  @system.channels_section.assert_channel_present(TestData.channel_search)
end

When(/^I create a private channel$/) do
  @system.channels_section.create_private_channel
end

Then(/^A private channel should appear in my list of channels$/) do
  @system.channels_section.assert_private_channel_created
  @system.channels_section.archive_channel
end

When(/^I create a public channel$/) do
  @system.channels_section.create_public_channel
end

Then(/^A public channel should appear in my list of channels$/) do
  @system.channels_section.assert_public_channel_created
  @system.channels_section.delete_channel
end

When(/^I sort the channels by creation date$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^They should be listed in date order$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I open archived channels$/) do
  @system.channels_section.open_archived_channels
end

Then(/^I should see the archived channels$/) do
  @system.channels_section.assert_archived_channels_opened
end

Given(/^I am logged in and on general channel$/) do
  @system.login_page.visit
  @system.login_page.send_login_credentials(TestData.users[1][:email], TestData.users[1][:password])
  @system.login_page.check_for_channel('general')
  @system.channels_section.change_channel('general')
end

When(/^I pick a different channel$/) do
  @system.channels_section.change_channel('random')
end

Then(/^The channel should open$/) do
  @system.channels_section.assert_channel_open('random')
end

When(/^I open about channels$/) do
  @system.channels_section.about_channels
end

Then(/^I should be redirected to the meesaging page and shown an alert box$/) do
  @system.channels_section.assert_about_alert
end

When(/^I receive a message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The channel name should change to white$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I change the purpose of the channel$/) do
  @system.channels_section.change_purpose(TestData.purpose)
end

Then(/^It should be updated at the top of the page$/) do
  @system.channels_section.assert_purpose_changed(TestData.purpose)
  @system.channels_section.change_purpose(TestData.default_purpose)
end

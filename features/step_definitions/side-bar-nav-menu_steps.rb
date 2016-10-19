Given(/^I am logged in and on the messaging window$/) do
  @system.login_page.visit
  @system.login_page.send_login_credentials(TestData.users[1][:email], TestData.users[1][:password])
  @system.login_page.check_for_channel('general')
end

When(/^I navigate to profile and account$/) do
  @system.sidebar_section.go_to_profile_and_account
end

Then(/^A sidebar should be shown$/) do
  @system.sidebar_section.assert_profile_page_appears(TestData.full_name)
end

When(/^I navigate to preferences$/) do
  @system.sidebar_section.go_to_preferences
end

Then(/^I should be taken to the preferences page$/) do
  @system.sidebar_section.assert_preferences_appears(TestData.preferences_heading)
end

When(/^I set myself to away$/) do
  @system.sidebar_section.set_away
end

Then(/^My account should be away$/) do
  @system.sidebar_section.assert_away
end

When(/^I naviagte to Help and Feedback$/) do
  @system.sidebar_section.go_to_help_and_feedback
end

Then(/^I should be taken to the help page$/) do
  @system.sidebar_section.assert_feedback_appears(TestData.feedback_heading)
end

When(/^I click invite people$/) do
  @system.sidebar_section.invite_people
end

Then(/^I should be taken to the page to invite people$/) do
  @system.sidebar_section.assert_invite_page_appears(TestData.invite_people_heading)
end

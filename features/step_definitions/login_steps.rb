Given(/^i am on the sign in page$/) do
  @system.login_page.visit
end

When(/^i login with valid details$/) do
  @system.login_page.send_login_credentials('slacktestgerrard@gmail.com', 'slackpass')
end

Then(/^i should see the general slack channel$/) do
  @system.login_page.check_for_channel('general')
end

When(/^i enter a valid team name$/) do
  @system.login_page.send_team_name('slack-web-automation2')
end

When(/^i attempt to log in with invalid details$/) do
  @system.login_page.send_login_credentials('slacktestgerrard@gmail.co.uk', 'slackfail')
end

Then(/^i should see an error message$/) do
  @system.login_page.assert_error_message
end

When(/^i enter a valid teamname that i am not a member of$/) do
  @system.login_page.send_team_name('skybettingandgaming')
end

When(/^i attempt to login with valid details$/) do
  @system.login_page.send_login_credentials('slacktestgerrard@gmail.com', 'slackpass')
end

When(/^i attempt to login with an invalid team name$/) do
  @system.login_page.send_team_name('thisisainvalidslackname3257425')
  @system.login_page.assert_error_message
end

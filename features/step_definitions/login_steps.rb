Given(/^i am on the sign in page$/) do
  @system.loginSlack.visit
  expect(@browser.find_element(id: "domain").displayed?).not_to eq nil
end

When(/^i enter the team name$/) do
  @system.loginSlack.sendTeamName("slack-web-automation2")
  expect(@browser.find_element(id: "email").displayed?).not_to eq nil
end

When(/^i enter my valid email and password$/) do
  @system.loginSlack.sendLoginCredentials('slacktestgerrard@gmail.com','slackpass')
end

When(/^i click sign in$/) do
  @system.loginSlack.clickEnterButton
  expect(@browser.find_element(id: "direct_messages").displayed?).not_to eq nil 
end

Then(/^i should see the general slack channel$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i enter my invalid email and password$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^i should see an appropriate error message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i enter the incorrect but a valid team name$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i enter an invalid team name$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^i click 'continue'$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

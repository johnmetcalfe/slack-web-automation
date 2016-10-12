wait = Selenium::WebDriver::Wait.new(:timeout => 15)

Given(/^i am on the sign in page$/) do
  @system.login.visit
  expect(@browser.find_element(id: 'domain').displayed?).not_to eq nil
end

When(/^i enter the team name$/) do
  @system.login.send_team_name('slack-web-automation2')
  expect(@browser.find_element(id: 'email').displayed?).not_to eq nil
end

When(/^i enter my valid email and password$/) do
  @system.login.send_login_credentials('slacktestgerrard@gmail.com','slackpass')
  expect(@browser.find_element(id: 'email')).not_to eq nil
end

When(/^i click sign in$/) do
  @system.login.click_enter_button
  if @browser.find_elements(class: 'alert_error').size() > 0
    expect(@browser.find_element(class: 'alert_error').displayed?).to eq true
  else
    wait.until {
      @browser.find_element(id: 'direct_messages').displayed?
    }
    expect(@browser.find_element(id: 'direct_messages').displayed?).not_to eq nil
  end
end

Then(/^i should see the general slack channel$/) do
  @browser.get('https://slack-web-automation2.slack.com/messages/general/')
  wait.until {
    @browser.find_element(id: 'channel_title').displayed?
  }
  expect(@browser.find_element(id: 'channel_title').attribute('innerHTML')).to eq '#general'
end

When(/^i enter my invalid email and password$/) do
 @system.login.send_login_credentials('slacktestgerrard@gmail.co.uk','slackfail')
 @system.login.click_enter_button
 expect(@system.login.url).to eq 'https://slack-web-automation2.slack.com/'
 expect(@browser.find_element(class: 'alert_error').displayed?).to eq true
end

Then(/^i should see an appropriate error message$/) do
 expect(@browser.find_element(class: 'alert_error').displayed?).to eq true
end

When(/^i enter the incorrect but a valid team name$/) do
  @system.login.send_team_name('skybettingandgaming')
end

When(/^i enter an invalid team name$/) do
  @system.login.send_team_name('thisisainvalidslackname3257425')
  expect(@browser.find_element(class: 'alert_error').displayed?).to eq true
end

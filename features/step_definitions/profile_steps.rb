Given(/^I am on the profile page$/) do
  @system.login_page.visit
  @system.login_page.send_login_credentials(TestData.users[1][:email], TestData.users[1][:password])
  @system.login_page.check_for_channel('general')
  @system.profile_page.open_profile
end

When(/^I change the profile First Name$/) do
  @system.profile_page.change_first_name(TestData.first_name)
end

Then(/^The First Name should be updated on the page$/) do
  @system.profile_page.assert_first_name_changed(TestData.first_name)
  @system.profile_page.change_first_name(TestData.default_first_name)
end

When(/^I change the profile Last Name$/) do
  @system.profile_page.change_last_name(TestData.last_name)
end

Then(/^The Last Name should be updated on the page$/) do
  @system.profile_page.assert_last_name_changed(TestData.last_name)
  @system.profile_page.change_last_name(TestData.default_last_name)
end

When(/^I chaneg the profile What I Do$/) do
  @system.profile_page.change_what_I_do(TestData.what_I_do)
end

Then(/^The What I Do should be updated on the page$/) do
  @system.profile_page.assert_what_I_do_changed(TestData.what_I_do)
  @system.profile_page.change_what_I_do(TestData.default_what_I_do)
end

When(/^I change the profile Phone Number$/) do
  @system.profile_page.change_phone_number(TestData.phone_number)
end

Then(/^The Phone Number shold be update on the page$/) do
  @system.profile_page.assert_phone_number_changed(TestData.phone_number)
  @system.profile_page.change_phone_number(TestData.default_phone_number)
end

When(/^I Change the profile Skype$/) do
  @system.profile_page.change_skype(TestData.skype)
end

Then(/^The Skype should be updated on the page$/) do
  @system.profile_page.assert_skype_changed(TestData.skype)
  @system.profile_page.change_skype(TestData.default_skype)
end

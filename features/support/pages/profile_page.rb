class ProfilePage < GenericPage

  def visit
    goto "#{TestData.url}/messages/general/team/slacktestrob/"
  end

  def open_profile
    sleep 2
    @@wait.until do
      el(:team_menu).displayed?
    end
    el(:team_menu).click
    sleep 2
    @@wait.until do
      el(:team_menu_profile).displayed?
    end
    el(:team_menu_profile).click
    sleep 2
    @@wait.until do
      el(:edit_profile_open).displayed?
    end
    el(:edit_profile_open).click
    sleep 2
  end

  def change_first_name(first_name)
    el(:first_name).clear
    el(:first_name).send_keys first_name
    el(:profile_save).click
  end

  def assert_first_name_changed(first_name)
    open_profile
    expect(el(:first_name).attribute("value")).to eq first_name
  end

  def change_last_name(last_name)
    el(:last_name).clear
    el(:last_name).send_keys last_name
    el(:profile_save).click
  end

  def assert_last_name_changed(last_name)
    open_profile
    expect(el(:last_name).attribute("value")).to eq last_name
  end

  def change_what_I_do(what_I_do)
    el(:what_I_do).clear
    el(:what_I_do).send_keys what_I_do
    el(:profile_save).click
  end

  def assert_what_I_do_changed(what_I_do)
    open_profile
    expect(el(:what_I_do).attribute("value")).to eq what_I_do
  end

  def change_phone_number(phone_number)
    el(:phone_number).clear
    el(:phone_number).send_keys phone_number
    el(:profile_save).click
  end

  def assert_phone_number_changed(phone_number)
    open_profile
    expect(el(:phone_number).attribute("value")).to eq phone_number
  end

  def change_skype(skype)
    el(:skype).clear
    el(:skype).send_keys skype
    el(:profile_save).click
  end

  def assert_skype_changed(skype)
    open_profile
    expect(el(:skype).attribute("value")).to eq skype
  end



  ##### DICTIONARY #####

  @@dictionary = {
    edit_profile_open: "#member_preview_scroller > div > div.member_action_bar > a:nth-child(1)",
    team_menu: "#team_menu",
    team_menu_profile: "#member_account_item > a",
    first_name: "#edit_member_profile_list > div.clearfix.display_flex.flex_wrap.position_relative > p > input",
    profile_save: "#fs_modal_footer > button.btn.left_margin.dialog_go.edit_member_profile_confirm_edit_btn.ladda-button > span.ladda-label",
    last_name: "#edit_member_profile_list > div:nth-child(3) > p > input",
    what_I_do: "#edit_member_profile_list > div:nth-child(4) > p > input",
    phone_number: "#edit_member_profile_list > div:nth-child(5) > p > input",
    skype: "#edit_member_profile_list > div:nth-child(6) > p > input"



  }

  def el(window_number = 0, symbol)
    @driver[window_number].find_element(css: @@dictionary[symbol])
  end

  def els(window_number = 0, symbol)
    @driver[window_number].find_elements(css: @@dictionary[symbol])
  end

end

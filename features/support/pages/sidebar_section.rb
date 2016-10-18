class SidebarSection < GenericPage

  def go_to_profile_and_account
    sleep 1
    el(:team_menu).click
    sleep 1
    el(:profile_and_account).click
  end

  def assert_profile_page_appears(full_name)
    sleep 1
    expect(el(:member_name).attribute("innerHTML")).to eq full_name
  end

  def go_to_preferences
    sleep 1
    el(:team_menu).click
    sleep 1
    el(:member_preferences).click
  end

  def assert_preferences_appears(preferences_heading)
    sleep 1
    expect(source.include? preferences_heading).to be true
  end

  @@dictionary = {
    team_menu: "#team_menu",
    profile_and_account: "#member_account_item > a",
    member_name: ".member_name",
    member_preferences: "#member_prefs_item"
  }


  def el(symbol)

    @driver.find_element(css: @@dictionary[symbol])

  end

  def els(symbol)

    @driver.find_elements(css: @@dictionary[symbol])

  end

end

class SidebarSection < GenericPage


  def toggle_away(input)
    sleep 2
    case input
    when 'away' === input
      if el(:away_circle).attribute("class") == "ts_icon ts_icon_presence active" then
        el(:team_menu).click
        el(:away_toggle).click
      end
    when 'active' === input
      if el(:away_circle).attribute("class") == "ts_icon ts_icon_presence away" then
        el(:team_menu).click
        el(:away_toggle).click
      end
    else
    end
  end

  def assert_away
    @@wait.until do
      el(:away_circle).attribute("class") == "ts_icon ts_icon_presence away"
    end
    expect(el(:away_circle).attribute("class")).to eq "ts_icon ts_icon_presence away"
    sleep 2
  end

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
    away_toggle: "#member_presence > a > span",
    away_circle: "#presence",
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

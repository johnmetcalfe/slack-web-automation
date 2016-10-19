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



  ##### DICTIONARY #####

  @@dictionary = {
    team_menu: "#team_menu",
    away_toggle: "#member_presence > a > span",
    away_circle: "#presence"
  }

  def el(symbol)

    @driver.find_element(css: @@dictionary[symbol])

  end

  def els(symbol)

    @driver.find_elements(css: @@dictionary[symbol])

  end

end

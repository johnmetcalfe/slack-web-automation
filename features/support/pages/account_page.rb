class SlackAccountPage < GenericPage

  def visit
    @driver.get "https://slack-web-automation2.slack.com/account/settings"
  end

  def expand_username
    sleep 1
    @driver.find_element(css: '#change_username > a').click

  end

  def change_username(user)
    @driver.find_element(class: "username_input").clear
    @driver.find_element(class: "username_input").send_keys user
    @driver.find_element(css: "#change_username > div > form > div > button").click
  end

  def reset_username
    @driver.find_element(class: "username_input").clear
    @driver.find_element(class: "username_input").send_keys "slacktestbob"
    @driver.find_element(css: "#change_username > div > form > div > button").click
  end

end

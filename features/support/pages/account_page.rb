class SlackAccountPage < GenericPage

  def visit
    @driver.get "#{TestData.url}/account/settings"
  end

  def expand_username
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

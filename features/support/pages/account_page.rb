class SlackAccountPage < GenericPage

  def visit
    @driver.get "#{TestData.url}/account/settings"
  end

  def expand_username
    @driver.find_element(css: '#change_username > a').click
  end

  def change_username(user)
    @user = user
    @driver.find_element(class: "username_input").clear
    @driver.find_element(class: "username_input").send_keys @user
    @driver.find_element(css: "#change_username > div > form > div > button").click
  end

  def assert_username
    @driver.find_element(class: "username_input").to eq(@user)
  end

  def reset_username
    @driver.find_element(class: "username_input").clear
    @driver.find_element(class: "username_input").send_keys "slacktestbob"
    @driver.find_element(css: "#change_username > div > form > div > button").click
  end

  def expand_password
    @driver.find_element(css: "#change_password > a").click
  end

  def type_current_pass
    @driver.find_element(id: "old_password").send_keys TestData.password
  end

  def type_new_pass
    #INCREMENT PASSWORD BY 1
    my_string = TestData.password
    hello = my_string.scan( /\d+$/ ).first
    new_string = my_string.gsub(/(\W|\d)/, "")
    number = hello.to_i
    new_number = number + 1
    new_number.to_s
    new_pass = "#{new_string}#{new_number}"
    binding.pry

    @driver.find_element(id: "password").send_keys new_pass

    @driver.find_element(css: "#change_password > div > form.col.span_1_of_2 > p:nth-child(5) > button").click
    # CURRENTLY DOES NOT WRITE TO YAML FILE
    data = YAML.load_file "../test_data/*.yml"
    data["password"] = new_pass
    File.open("../test_data/*.yml", 'w') { |f| YAML.dump(data, f) }

  end

end

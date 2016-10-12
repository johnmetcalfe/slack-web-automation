class AccountPage < GenericPage

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

  def assert_username(user)
    @driver.find_element(class: "username_input").to eq(user)
  end

  def reset_username
    @driver.find_element(class: "username_input").clear
    @driver.find_element(class: "username_input").send_keys "testuser"
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

    @driver.find_element(id: "password").send_keys new_pass

    @driver.find_element(css: "#change_password > div > form.col.span_1_of_2 > p:nth-child(5) > button").click
    # CURRENTLY DOES NOT WRITE TO YAML FILE

    d = YAML::load_file(File.dirname(__FILE__) + "/../test_data/settings.yml") #Load
    d['password'] = new_pass #Modify
    File.write(File.dirname(__FILE__) + "/../test_data/settings.yml", d.to_yaml)
  end

  def assert_password_updated
    source.include? "Your password has been updated successfully."
  end

  def expand_email
    @driver.find_element(css: "#change_email > a").click
  end

  def email_pass
    @driver.find_element(id: "email_password").send_keys TestData.password
  end

  def new_email
    @driver.find_element(id: "new_email").send_keys "john.metcalfe16@gmail.com"
  end

  def sumbit_email
    @driver.find_element(css: "#email_form > p:nth-child(5) > button").click
  end

  def assert_email
    source.include? "john.metcalfe16@gmail.com"
  end

  def old_email
    @driver.find_element(id: "new_email").send_keys "slacktestbob@gmail.com"
  end

  def expand_timezone
    @driver.find_element(css: "#change_timezone > a").click
  end

  def open_dropdown
    @driver.find_element(css: "#change_timezone > form > div > p.no_bottom_margin > label > select").click
  end

  def select_timezone(timezone)
    @driver.find_elements(css: "#change_timezone > form > div > p.no_bottom_margin > label > select > option").each do |zone|
      zone.click if zone.attribute("value") == timezone
    end
    @driver.find_element(css: "#change_timezone > form > div > p:nth-child(2) > button > span.ladda-label").click
  end

  def assert_timezone
    @driver.find_element(css: '#change_timezone > form > p > b').text.include? "Cabo Verde"
    expand_timezone
    open_dropdown
    @driver.find_element(css: "#change_timezone > form > div > p.no_bottom_margin > label > select > option:nth-child(41)").click
    binding.pry
    @driver.find_element(css: "#change_timezone > form > div > p:nth-child(2) > button > span.ladda-label").click
    @driver.find_element(css: '#change_timezone > form > p > b').text.include? "Dublin"
  end

end

class AccountPage < GenericPage

  def visit
    @driver.get "#{TestData.url}/account/settings"
  end


  def expand_section(section)
    @driver.find_element(css: "#change_#{section.to_s} > a").click
  end

  ##### USERNAME TEST FUNCTIONS #####

  def change_username_to(user)
    expand_section :username
    @driver.find_element(class: "username_input").clear
    @driver.find_element(class: "username_input").send_keys user
    @driver.find_element(css: "#change_username > div > form > div > button").click
  end

  def assert_username_is(user)
    expand_section :username
    expect(@driver.find_element(class: "username_input").attribute("value")).to eq(user)
  end

  def reset_username_to(user)
    @driver.find_element(class: "username_input").clear
    @driver.find_element(class: "username_input").send_keys user
    @driver.find_element(css: "#change_username > div > form > div > button").click
  end

  ##### PASSWORD TEST FUNCTIONS #####

  def change_password
    expand_section :password
    @driver.find_element(id: "old_password").send_keys TestData.password
    my_string = TestData.password
    hello = my_string.scan( /\d+$/ ).first
    new_string = my_string.gsub(/(\W|\d)/, "")
    number = hello.to_i
    new_number = number + 1
    new_number.to_s
    $new_pass = "#{new_string}#{new_number}"
    @driver.find_element(id: "password").send_keys $new_pass
    @driver.find_element(css: "#change_password > div > form.col.span_1_of_2 > p:nth-child(5) > button").click
    d = YAML::load_file(File.dirname(__FILE__) + "/../test_data/settings.yml") #Load
    d['password'] = $new_pass #Modify
    File.write(File.dirname(__FILE__) + "/../test_data/settings.yml", d.to_yaml)
  end

  def assert_password_changed
    expect(source.include? "Your password has been updated successfully.").to be true
  end

  ##### EMAIL TEST FUNCTIONS #####

  def change_email_to(email)
    expand_section :email
    @driver.find_element(id: "email_password").send_keys TestData.password
    @driver.find_element(id: "new_email").send_keys email
    @driver.find_element(css: "#email_form > p:nth-child(5) > button").click
  end

  def assert_email_is(email)
    expect(source.include? email).to be true
  end

  def reset_email_to_default
    expand_section :email
    @driver.find_element(id: "email_password").send_keys TestData.password
    @driver.find_element(id: "new_email").send_keys "slacktestbob@gmail.com"
  end

  ##### TIMEZONE TEST FUNCTIONS #####

  def change_timezone_to(timezone)
    expand_section :timezone
    @driver.find_element(css: "#change_timezone > form > div > p.no_bottom_margin > label > select").click
    @driver.find_elements(css: "#change_timezone > form > div > p.no_bottom_margin > label > select > option").each do |zone|
      zone.click if zone.attribute("value") == timezone
    end
    @driver.find_element(css: "#change_timezone > form > div > p:nth-child(2) > button > span.ladda-label").click
  end

  def assert_timezone_is(timezone)
    new_timezone = timezone.split('/')[-1]
    @driver.find_element(css: '#change_timezone > form > p > b').text.include? new_timezone
  end

  ##### DICTIONARY #####

  @@dictionary = {
    
  }

end

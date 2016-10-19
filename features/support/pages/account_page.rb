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
    el(:username_input).clear
    el(:username_input).send_keys user
    el(:username_submit_button).click
  end

  def assert_username_is(user)
    expand_section :username
    expect(el(:username_input).attribute("value")).to eq(user)
  end

  def reset_username_to(user)
    el(:username_input).clear
    el(:username_input).send_keys user
    el(:username_submit_button).click
  end

  ##### PASSWORD TEST FUNCTIONS #####

  def change_password
    expand_section :password
    my_string = TestData.users[0][:password]
    el(:password_old_field).send_keys TestData.users[0][:password]
    hello = my_string.scan( /\d+$/ ).first
    new_string = my_string.gsub(/(\W|\d)/, "")
    number = hello.to_i
    new_number = number + 1
    new_number.to_s
    $new_pass = "#{new_string}#{new_number}"
    el(:password_new_field).send_keys $new_pass
    el(:password_submit_button).click
    d = YAML::load_file(File.dirname(__FILE__) + "/../test_data/users.yml") #Load
    d['users'][0]['password'] = $new_pass #Modify
    File.write(File.dirname(__FILE__) + "/../test_data/users.yml", d.to_yaml)
  end

  def assert_password_changed
    expect(source.include? "Your password has been updated successfully.").to be true
  end

  ##### EMAIL TEST FUNCTIONS #####

  def change_email_to(email)
    expand_section :email
    el(:email_password_field).send_keys TestData.users[0][:password]
    el(:email_new_field).send_keys email
    el(:email_submit_button).click
  end

  def assert_email_is(email)
    expect(source.include? email).to be true
  end

  def reset_email_to_default
    expand_section :email
    el(:email_password_field).send_keys TestData.users[0][:password]
    el(:email_new_field).send_keys TestData.users[0][:email]
    el(:email_submit_button).click
  end

  ##### TIMEZONE TEST FUNCTIONS #####

  def change_timezone_to(timezone)
    expand_section :timezone
    el(:timezone_open_dropdown_button).click
    els(:timezone_dropdown_options).each do |zone|
      zone.click if zone.attribute("value") == timezone
    end
    el(:timezone_submit_button).click
  end

  def assert_timezone_is(timezone)
    new_timezone = timezone.split('/')[-1]
    sleep 1
    el(:timezone_text).text.include? new_timezone
  end



  ##### DICTIONARY #####

  @@dictionary = {
    email_password_field: "#email_password",
    email_new_field: "#new_email",
    email_submit_button: "#email_form > p:nth-child(5) > button",
    password_new_field: "#password",
    password_old_field: "#old_password",
    password_submit_button: "#change_password > div > form.col.span_1_of_2 > p:nth-child(5) > button",
    timezone_open_dropdown_button: "#change_timezone > form > div > p.no_bottom_margin > label > select",
    timezone_dropdown_options: "#change_timezone > form > div > p.no_bottom_margin > label > select > option",
    timezone_submit_button: "#change_timezone > form > div > p:nth-child(2) > button",
    timezone_text: "#change_timezone > form > p > b",
    username_input: ".username_input",
    username_submit_button: "#change_username > div > form > div > button"
  }

  def el(symbol)

    @driver.find_element(css: @@dictionary[symbol])

  end

  def els(symbol)

    @driver.find_elements(css: @@dictionary[symbol])

  end

end

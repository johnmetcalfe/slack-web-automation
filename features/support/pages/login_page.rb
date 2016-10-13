class LoginPage < GenericPage
  @@wait = Selenium::WebDriver::Wait.new(timeout: 15)

  def visit
    @driver.get 'https://slack.com/signin'
    expect(@driver.find_element(id: 'domain').displayed?).not_to eq nil
  end

  def send_team_name(teamName)
    @driver.find_element(id: 'domain').send_keys(teamName)
    @driver.find_element(id: 'submit_team_domain').click
    unless @driver.find_elements(id: 'email').empty?
      expect(@driver.find_element(id: 'email').displayed?).not_to eq nil
    end
    # return self
  end

  def send_login_credentials(email, password)
    unless @driver.find_elements(id: 'domain').empty?
      send_team_name('slack-web-automation2')
    end
    expect(@driver.find_element(id: 'email').displayed?).not_to eq nil
    @driver.find_element(id: 'email').send_keys(email)
    expect(@driver.find_element(id: 'email')).not_to eq nil
    @driver.find_element(id: 'password').send_keys(password)
    click_enter_button
  end

  def check_for_channel(channel_name)
    @driver.get("https://slack-web-automation2.slack.com/messages/#{channel_name}")
    @@wait.until do
      @driver.find_element(id: 'channel_title').displayed?
    end
    expect(@driver.find_element(id: 'channel_title').attribute('innerHTML')).to eq "##{channel_name}"
  end

  def click_enter_button
    @driver.find_element(id: 'signin_btn').click
  end

  def assert_error_message
    if els(:alert_error).empty?
      @@wait.until do
        @driver.find_element(id: 'direct_messages').displayed?
      end
      variable = @driver.find_element(id: 'direct_messages').displayed?
      expect(variable).not_to eq nil
    else
      expect(el(:alert_error).displayed?).to eq true
    end
  end

  @@dictionary = {
    alert_error: '.alert_error'
  }

  def el(symbol)
    @driver.find_element(css: @@dictionary[symbol])
  end

  def els(symbol)
    @driver.find_elements(css: @@dictionary[symbol])
  end
end

# class Selenium::WebDriver::HTMLElement
#   def when_present
#     wait.until { self.displayed? }
#     return self
#   end
# end
#
# el(:time_zone_expand_button).when_present.click

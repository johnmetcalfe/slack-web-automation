class LoginPage < GenericPage
  @@wait = Selenium::WebDriver::Wait.new(timeout: 15)

  def visit
    @driver.get 'https://slack.com/signin'
    expect(el(:domain).displayed?).not_to eq nil
  end

  def send_team_name(teamName)
    el(:domain).send_keys(teamName)
    el(:submit_team_domain).click
    unless els(:email).empty?
      expect(el(:email).displayed?).not_to eq nil
    end
    # return self
  end

  def send_login_credentials(email, password)
    unless els(:domain).empty?
      send_team_name('slack-web-automation2')
    end
    expect(el(:email).displayed?).not_to eq nil
    el(:email).send_keys(email)
    expect(el(:email)).not_to eq nil
    el(:password).send_keys(password)
    click_enter_button
  end

  def check_for_channel(channel_name)
    @driver.get("https://slack-web-automation2.slack.com/messages/#{channel_name}")
    @@wait.until do
      el(:channel_title).displayed?
    end
    expect(el(:channel_title).attribute('innerHTML')).to eq "##{channel_name}"
  end

  def click_enter_button
    el(:signin_btn).click
  end

  def assert_error_message
    if els(:alert_error).empty?
      @@wait.until do
        el(:direct_messages).displayed?
      end
      expect(el(:direct_messages).displayed?).not_to eq nil
    else
      expect(el(:alert_error).displayed?).to eq true
    end
  end

  @@dictionary = {
    alert_error: '.alert_error',
    channel_title: '#channel_title',
    direct_messages: '#direct_messages',
    domain: '#domain',
    email: '#email',
    password: '#password',
    signin_btn: '#signin_btn',
    submit_team_domain: '#submit_team_domain'
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

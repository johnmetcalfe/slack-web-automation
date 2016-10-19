class LoginPage < GenericPage

  def visit
    goto 'https://slack.com/signin'
    expect(el(:domain).displayed?).not_to eq nil
  end

  def send_team_name(team_name)
    el(:domain).send_keys(team_name)
    el(:submit_team_domain).click
    expect(el(:email).displayed?).not_to eq nil unless els(0, :email).empty?
  end

  def send_login_credentials(email, password)
    send_team_name('slack-web-automation2') unless els(:domain).empty?
    expect(el(:email).displayed?).not_to eq nil
    el(:email).send_keys(email)
    expect(el(:email)).not_to eq nil
    el(:password).send_keys(password)
    click_enter_button
  end

  def check_for_channel(window_number = 0,channel_name)
    goto "https://slack-web-automation2.slack.com/messages/#{channel_name}"
    @@wait.until do
      el(:channel_title).displayed?
    end
    expect(el(:channel_title).attribute('innerHTML')).to eq "##{channel_name}"
     goto "#{TestData.url}/signin"
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

  def el(window_number = 0, symbol)
    @driver[window_number].find_element(css: @@dictionary[symbol])
  end

  def els(window_number = 0, symbol)
    @driver[window_number].find_elements(css: @@dictionary[symbol])
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

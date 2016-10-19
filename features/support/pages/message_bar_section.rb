class MessageBar < GenericPage

def send_message
  expect(url).to include "https://slack-web-automation2.slack.com/messages"
  @@wait.until do
  el(:message_input).displayed?
  end
  el(:message_input).send_keys("this message should appear in the textbox \n")
  #binding.pry
  expect(els(:message_body)[-1].attribute('innerHTML')).to eq 'this message should appear in the textbox'

end

@@dictionary = {
  alert_error: '.alert_error',
  channel_title: '#channel_title',
  direct_messages: '#direct_messages',
  domain: '#domain',
  email: '#email',
  password: '#password',
  signin_btn: '#signin_btn',
  submit_team_domain: '#submit_team_domain',
  message_input: '#message-input',
  message_body: '.message_body'
}

def el(window_number = 0, symbol)
  @driver[window_number].find_element(css: @@dictionary[symbol])
end

def els(window_number = 0, symbol)
  @driver[window_number].find_elements(css: @@dictionary[symbol])
end

end

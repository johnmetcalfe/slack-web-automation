class MessageBar < GenericPage

def send_message
  expect(url).to include "https://slack-web-automation2.slack.com/messages"
  @@wait.until do
  el(:message_input).displayed?
  end
  el(:message_input).send_keys("this message should appear in the textbox \n")
  #binding.pry

end

def check_message_sent
  expect(els(:message_body)[-1].attribute('innerHTML')).to eq 'this message should appear in the textbox'
end

def send_emoji
  expect(url).to include "https://slack-web-automation2.slack.com/messages"
  # @@wait.until do
  # els(:emoji_button).length > 0
  # end
  sleep 3
  el(:message_input).send_keys("this makes sure the previous test does not contain an emoji\n")
  els(:emoji_button)[0].click
  @@wait.until do
    els(:emoji_icons).length > 0
  end
  els(:emoji_icons).sample.click
  sleep 2
  expect(el(:message_input)).not_to eq nil
  el(:message_input).send_keys("\n")
end

def check_emoji
  expect(els(:message_body)[-1].attribute('innerHTML')).to include('emoji')
  binding.pry
end

@@dictionary = {
  message_input: '#message-input',
  message_body: '.message_body' ,
  emoji_button: '.ts_icon_happy_smile',
  emoji_icons: '.emoji_li'
}

def el(window_number = 0, symbol)
  @driver[window_number].find_element(css: @@dictionary[symbol])
end

def els(window_number = 0, symbol)
  @driver[window_number].find_elements(css: @@dictionary[symbol])
end

end

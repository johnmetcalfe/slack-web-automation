class DirectMessagesSection < GenericPage

  def assert_single_recipient
    @@wait.until do
      el(:im_title).displayed?
    end
    expect(el(:im_title).text).to eq "@#{TestData.users[1][:username]}"
  end

  # TODO: change this method to use array instead of set number of users
  def start_direct_message(user1="", user2="", user3="")
    @@wait.until do
      el(:direct_messages_header).displayed?
    end
    el(:direct_messages_header).click
    @@wait.until do
      el(:im_browser_filter).displayed?
    end
    if user2 == "" && user3 == ""
      el(:im_browser_filter).send_keys user1 + "\n"
      el(:im_browser_go).click
    else
      el(:im_browser_filter).send_keys user1 + "\n" + user2 + "\n" + user3 + "\n"
      el(:im_browser_go).click
    end
  end

  def assert_multiple_recipient
    @@wait.until do
      el(:dm_title).displayed?
    end
    expect(el(:dm_title).text).to eq "#{TestData.users[3][:username]} #{TestData.users[0][:username]} #{TestData.users[1][:username]}"
  end

  def check_entered_conversation
    @@wait.until do
      el(:direct_messages_header).displayed?
    end
    el(:user2_class).click
    expect(el(:im_title).text).to eq "@#{TestData.users[0][:username]}"
  end

  def change_conversation
    @@wait.until do
      el(:direct_messages_header).displayed?
    end
    el(:user3_class).click
  end

  def assert_conversation_changed
    expect(el(:im_title).text).to eq "@#{TestData.users[1][:username]}"
  end

  def send_message
    change_conversation
    el(:message_input).send_keys "Hello, this is a message\n"
  end

  def check_message_received
    new_browser
    @@wait.until do
      el(-1, :user1_class).displayed?
    end
    sleep 2
    expect(el(-1, :user1_unread).text).to eq "1"
    # clicks to get rid of notification
    el(-1, :user1_class).click
    # TODO: change sleeps to wait for message unread banner to disappear
    sleep 3
    el(-1, :user2_class).click
    sleep 2
    @driver[-1].quit
  end

  @@dictionary = {
    direct_messages_header: '#direct_messages_header',
    im_browser_filter: '#im_browser_filter',
    im_title: '#im_title',
    im_browser_go: '.im_browser_go',
    dm_title: '#dm_title',
    message_input: '#message-input',
    new_msg_info: '#new_msg_info',
    user1_class: '.member_U2MU1L277',
    user2_class: '.member_U2MTJVDJ5',
    user3_class: '.member_U2MTRCPU2',
    user1_unread: '.unread_highlight_U2MU1L277'
  }

  def el(window_number = 0, symbol)
    @driver[window_number].find_element(css: @@dictionary[symbol])
  end

  def els(window_number = 0, symbol)
    @driver[window_number].find_elements(css: @@dictionary[symbol])
  end

end

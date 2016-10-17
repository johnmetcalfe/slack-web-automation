class DirectMessagesSection < GenericPage

  @@wait = Selenium::WebDriver::Wait.new(timeout: 15)
  @@user1 = "slacktestuser3"
  @@user2 = "slacktestbob"
  @@user3 = "slacktestrob"

  def assert_single_recipient
    @@wait.until do
      el(:im_title).displayed?
    end
    expect(el(:im_title).text).to eq "@#{@@user1}"
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
    expect(el(:dm_title).text).to eq "#{@@user1} #{@@user2} #{@@user3}"
  end

  def check_entered_conversation
    @@wait.until do
      el(:direct_messages_header).displayed?
    end
    @driver.find_element(class: "member_U2MTRCPU2").click
    expect(el(:im_title).text).to eq "@#{@@user3}"
    @driver.find_element(class: "member_U2MTJVDJ5").click
    expect(el(:im_title).text).to eq "@#{@@user2}"
  end

  @@dictionary = {
    direct_messages_header: '#direct_messages_header',
    im_browser_filter: '#im_browser_filter',
    im_title: '#im_title',
    im_browser_go: '.im_browser_go',
    dm_title: '#dm_title'
  }

  def el(symbol)
    @driver.find_element(css: @@dictionary[symbol])
  end

  def els(symbol)
    @driver.find_elements(css: @@dictionary[symbol])
  end

end

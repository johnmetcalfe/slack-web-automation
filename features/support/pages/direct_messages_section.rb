class DirectMessagesSection < GenericPage

  @@wait = Selenium::WebDriver::Wait.new(timeout: 15)

  def start_direct_message_single
    @@wait.until do
      el(:direct_messages_header).displayed?
    end
    el(:direct_messages_header).click
    @@wait.until do
      el(:im_browser_filter).displayed?
    end
    el(:im_browser_filter).send_keys "slackbot\n"
  end

  def assert_single_recipient
    expect(el(:im_title).text).to eq 'slackbot'
  end

  def start_direct_message_multiple
    @@wait.until do
      el(:direct_messages_header).displayed?
    end
    el(:direct_messages_header).click
    @@wait.until do
      el(:im_browser_filter).displayed?
    end
    el(:im_browser_filter).send_keys "slacktestuser3\n" + "slacktestbob\n" + "slacktestrob\n"
    el(:im_browser_go).click
  end

  def assert_multiple_recipient
    @@wait.until do
      el(:dm_title).displayed?
    end
    expect(el(:dm_title).text).to eq 'slacktestuser3 slacktestbob slacktestrob'
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

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
    expect(@driver.find_element(id: 'im_title').text).to eq 'slackbot'
  end

  @@dictionary = {
    im_list: '#im-list',
    direct_messages_header: '#direct_messages_header',
    im_browser_filter: '#im_browser_filter',
    im_title: '#im_title'
  }

  def el(symbol)
    @driver.find_element(css: @@dictionary[symbol])
  end

  def els(symbol)
    @driver.find_elements(css: @@dictionary[symbol])
  end

end

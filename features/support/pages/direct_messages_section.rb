class DirectMessagesSection < GenericPage

  @@wait = Selenium::WebDriver::Wait.new(timeout: 15)

  def check_for_direct_message_conversation
    expect(els(:im_list).empty?).to eq false
  end

  def search_for_conversation
    el(:direct_messages_header).click
    @@wait.until do
      el(:im_browser_filter).displayed?
    end
    el(:im_browser_filter).send_keys "slackbot\n"
  end

  def see_conversation
    expect(@driver.find_element(id: 'im_title').text).to eq 'slackbot'
  end

  def start_direct_message_single
    binding.pry
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

class ChannelsSection < GenericPage
  
  def open_channels
    @driver.find_element(css: "#channels_header > button").click
  end

  def search_for(channel)
    @driver.find_element(id: "channel_browser_filter").send_keys channel
  end

  def check_channel_present
    expect(@driver.find_element(css: "#channel_list_container > div > div:nth-child(2) > div.channel_browser_row_header.overflow_ellipsis > span.channel_browser_channel_name.bold")).to eq channel
  end

end

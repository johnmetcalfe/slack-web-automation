class ChannelsSection < GenericPage

  def open_channels
    sleep 4
    el(:channels_header).click
    sleep 4
  end

  def search_for(channel)
    el(:channel_serach_bar).send_keys channel
  end

  def assert_channel_present(channel)
    expect(el(:channel_search_list).attribute('innerHTML')).to eq channel
  end

  def create_private_channel
    el(:channel_create_button).click
    el(:channel_create_slider).click

    @privvy = SecureRandom.uuid
    @priv = @privvy.slice! 0..20


    el(:channel_create_name).send_keys @priv
    el(:channel_save_button).click
  end

  def create_public_channel
    el(:channel_create_button).click
    @pubby = SecureRandom.uuid
    @pub = @pubby.slice! 0..20
    el(:channel_create_name).send_keys @pub
    el(:channel_save_button).click
  end

  def assert_private_channel_created
    open_channels
    search_for(@priv)
    assert_channel_present(@priv)
    expect(el(:channel_lock_icon).attribute("class")).to eq "channel_browser_type_icon subtle_silver ts_icon_lock"
  end

  def assert_public_channel_created
    open_channels
    search_for(@pub)
    assert_channel_present(@pub)
    expect(el(:channel_hash_icon).attribute("class")).to eq "channel_browser_type_icon subtle_silver ts_icon_channel_pane_hash"
  end

  def archive_channel
    @driver.get "https://slack-web-automation2.slack.com/archives/archived"
    el(:archived_channels_tab).click
    @@wait.until do
      el(:archived_channels_filter).displayed?
      el(:archived_channels_select).displayed?
    end
    el(:archived_channels_filter).send_keys @priv
    @@wait.until do
      el(:archived_channels_select).displayed?
    end
    sleep 2
    el(:archived_channels_select).click
    @@wait.until do
      el(:archive_channel).displayed?
    end
    sleep 2
    el(:archive_channel).click
    @@wait.until do
      el(:archive_confirm).displayed?
    end
    sleep 2
    el(:archive_confirm).click
    @driver.get "https://slack-web-automation2.slack.com/archives/archived"
    el(:archived_channels_tab).click
  end

  def delete_channel
    @driver.get "https://slack-web-automation2.slack.com/archives/archived"
    el(:archived_channels_tab).click
    @@wait.until do
      el(:archived_channels_filter).displayed?
      el(:archived_channels_select).displayed?
    end
    el(:archived_channels_filter).send_keys @pub
    @@wait.until do
      el(:archived_channels_select).displayed?
    end
    sleep 2
    el(:archived_channels_select).click
    ##### NEED ADDING TO DICTIONARY #####
    @@wait.until do
      el(:delete_channel).displayed?
    end
    sleep 2
    el(:delete_channel).click
    @@wait.until do
      el(:delete_tick_box).displayed?
    end
    sleep 2
    el(:delete_tick_box).click
    @@wait.until do
      el(:delete_confirm).displayed?
    end
    sleep 2
    el(:delete_confirm).click
    @driver.get "https://slack-web-automation2.slack.com/archives/archived"
    el(:archived_channels_tab).click
  end

  def open_archived_channels
    @driver.get "https://slack-web-automation2.slack.com/archives/archived"
  end

  def assert_archived_channels_opened
    el(:archive_tab).displayed?
  end

  def change_channel(channel)
    els(:channels).each do |channels|
      channels.click if channels.attribute("href") == "https://slack-web-automation2.slack.com/archives/#{channel}"
    end

  end

  def assert_channel_open(channel)
    #### ADD A WAIT HERE IN THE MORNING #####
    @@wait.until do
      el(:channel_title).displayed?
    end
    expect(el(:channel_title).attribute("innerHTML")).to include channel
  end

  ##### DICTIONARY #####

  @@dictionary = {
    channel_title: "#channel_title",
    archived_channels: "#channel_browser_footer > a:nth-child(2)",
    archive_tab: "#channel_archives_tabs > a.secondary.selected",
    archived_channels_tab: "#channel_archives_tabs > a.archives_channel_tab",
    archived_channels_filter: "#channel_filter > input",
    archived_channels_select: "#channel_list > div > h4 > a",
    archive_channel: "#archive_btn > li > a",
    archive_confirm: "#generic_dialog > div.modal-footer.c-modal_footer--default > a.btn.dialog_go",
    channels: "#channel-list > li > a",
    channel_create_button: "#channel_browser > div.large_bottom_margin.display_flex.align_items_center > button",
    channel_save_button: "#save_channel",
    channel_create_name: "#channel_create_title",
    channel_create_slider: "#new_channel_modal > div.bottom_margin > div > div.ts_toggle_button",
    channels_header: "#channels_header > button",
    channel_lock_icon: "#channel_list_container > div > div.channel_browser_row.group_link > div.channel_browser_row_header.overflow_ellipsis > ts-icon.channel_browser_type_icon.subtle_silver.ts_icon_lock",
    channel_hash_icon: "#channel_list_container > div > div:nth-child(2) > div.channel_browser_row_header.overflow_ellipsis > ts-icon.channel_browser_type_icon.subtle_silver.ts_icon_channel_pane_hash",
    channel_serach_bar: "#channel_browser_filter",
    channel_search_list: "#channel_list_container > div > div:nth-child(2) > div.channel_browser_row_header.overflow_ellipsis > span.channel_browser_channel_name.bold",
    delete_channel: "#channel_actions_div > form:nth-child(10) > a",
    delete_tick_box: "#delete_channel_cb",
    delete_confirm: "#generic_dialog > div.modal-footer.c-modal_footer--default > a.btn.dialog_go.btn_danger"
  }

  def el(symbol)

    @driver.find_element(css: @@dictionary[symbol])

  end

  def els(symbol)

    @driver.find_elements(css: @@dictionary[symbol])

  end

  ##### INCREMENT #####

  def increment_channel_name(channel)

    my_string = channel
    hello = my_string.scan( /\d+$/ ).first
    new_string = my_string.gsub(/(\W|\d)/, "")
    number = hello.to_i
    new_number = number + 1
    new_number.to_s
    $new_channel_name = "#{new_string}#{new_number}"
    d = YAML::load_file(File.dirname(__FILE__) + "/../test_data/channels_section_test_data.yml") #Load
    d["private_channel"] = $new_channel_name #Modify
    File.write(File.dirname(__FILE__) + "/../test_data/channels_section_test_data.yml", d.to_yaml)

  end

end

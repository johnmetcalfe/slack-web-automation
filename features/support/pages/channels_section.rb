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

  def create_private_channel(channel)
    el(:channel_create_button).click
    el(:channel_create_slider).click


    increment_channel_name(channel)


    el(:channel_create_name).send_keys channel
    el(:channel_save_button).click
  end

  def assert_private_channel_created(channel)
    open_channels
    search_for(channel)
    assert_channel_present(channel)
    expect(el(:channel_lock_icon).attribute("class")).to eq "channel_browser_type_icon subtle_silver ts_icon_lock"
  end

  def archive_channel(channel)
    el(:archived_channels).click
    binding.pry
    @driver.switch_to.window("CDwindow-671F8534-C4FC-441A-B32D-43A61734B632")
    el(:archived_channels_tab).click
    el(:archived_channels_filter).send_keys channel
    el(:archived_channels_select).click
    el(:archive_channel).click
    el(:archive_confirm).click

  end

  def delete_channel(channel)
    el(:archived_channels).click
    el(:archived_channels_tab).click
    el(:archived_channel_filter).send_keys channel
    el(:archived_channels_select).click
    el(:delete_channel).click
    el(:delete_confirm).click
  end

  ##### DICTIONARY #####

  @@dictionary = {
    archived_channels: "#channel_browser_footer > a:nth-child(2)",
    archived_channels_tab: "#channel_archives_tabs > a.archives_channel_tab",
    archived_channels_filter: "#channel_filter > input",
    archived_channels_select: "#channel_list > div > h4 > a",
    archive_channel: "#archive_btn > li > a",
    archive_confirm: "#generic_dialog > div.modal-footer.c-modal_footer--default > a.btn.dialog_go",
    channel_create_button: "#channel_browser > div.large_bottom_margin.display_flex.align_items_center > button",
    channel_save_button: "#save_channel",
    channel_create_name: "#channel_create_title",
    channel_create_slider: "#new_channel_modal > div.bottom_margin > div > div.ts_toggle_button",
    channels_header: "#channels_header > button",
    channel_lock_icon: "#channel_list_container > div > div.channel_browser_row.group_link > div.channel_browser_row_header.overflow_ellipsis > ts-icon.channel_browser_type_icon.subtle_silver.ts_icon_lock",
    channel_serach_bar: "#channel_browser_filter",
    channel_search_list: "#channel_list_container > div > div:nth-child(2) > div.channel_browser_row_header.overflow_ellipsis > span.channel_browser_channel_name.bold"
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

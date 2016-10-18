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
    goto "https://slack-web-automation2.slack.com/archives/archived"
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
    goto "https://slack-web-automation2.slack.com/archives/archived"
    el(:archived_channels_tab).click
  end

  def delete_channel
    goto "https://slack-web-automation2.slack.com/archives/archived"
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
    goto "https://slack-web-automation2.slack.com/archives/archived"
    el(:archived_channels_tab).click
  end

  def sort_channels_by(category)
    el(:channel_sort_by).click
    els(:channel_sort_by_dropdown_options).each do |option|
      option.click if option.attribute("value") == category
    end
  end

  def assert_channels_sorted_by(category)
    channel_names = []
    creators = []
    dates_created = []
    number_of_members = []
    if category == "name"
      els(:channel_name).each do |name|
        channel_names << name.attribute("innerHTML")
      end
      first_channel_name = channel_names[0].split("")
      second_channel_name = channel_names[1].split("")
      expect(first_channel_name[0] <= second_channel_name[0])
    elsif category == "creator"
      els(:creator_name).each do |name|
        creators << name.attribute("innerHTML")
      end
      first_creator_name = creators[0].split("")
      second_creator_name = creators[1].split("")
      expect(first_creator_name[0] <= second_creator_name[0])
    elsif category == "created"
      els(:created_on).each do |date|
        dates_created << date.attribute("innerHTML")
      end
      first_date = Date.parse(dates_created[0])
      second_date = Date.parse(dates_created[1])
      expect(first_date >= second_date)
    elsif category == "members_high"
      els(:members).each do |number|
        number_of_members << number.attribute("innerHTML")
      end
      expect(number_of_members[0] >= number_of_members[1])
    else category == "members_low"
      els(:members).each do |number|
        number_of_members << number.attribute("innerHTML")
      end
      expect(number_of_members[0] <= number_of_members[1])
    end
  end

  def open_archived_channels
    goto "https://slack-web-automation2.slack.com/archives/archived"
  end

  def assert_archived_channels_opened
    el(:archive_tab).displayed?
  end

  def change_channel(channel)
    sleep 2
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

  def about_channels
    el(:about_channels).click
  end

  def assert_about_alert
    @@wait.until do
      el(:about_alert).displayed?
    end
    el(:about_alert).displayed?
  end

  def change_purpose(purpose)
    @@wait.until do
      el(:purpose).displayed?
    end
    sleep 4
    el(:purpose).click
    el(:purpose).send_keys purpose
    el(:purpose).send_keys "\n"
  end

  def assert_purpose_changed(purpose)
    expect(el(:purpose).attribute("innerHTML")).to eq purpose
  end

  ##### DICTIONARY #####

  @@dictionary = {
    purpose: "#channel_topic_text",
    about_alert: "#coachmark",
    about_channels: "#channel_browser_footer > a.subtle_silver.right_margin.about_channels",
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
    delete_confirm: "#generic_dialog > div.modal-footer.c-modal_footer--default > a.btn.dialog_go.btn_danger",
    channel_sort_by: "#channel_browser > div.small_bottom_margin.display_flex.align_items_center > div.channel_browser_sort_container > label",
    channel_sort_by_dropdown_options: "#channel_browser_sort > option",
    channel_name: ".channel_browser_channel_name",
    creator_name: ".channel_browser_creator_name",
    created_on: ".channel_browser_created_on",
    members: ".channel_browser_member_count"
  }

  def el(window_number = 0, symbol)
    @driver[window_number].find_element(css: @@dictionary[symbol])
  end

  def els(window_number = 0, symbol)
    @driver[window_number].find_elements(css: @@dictionary[symbol])
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

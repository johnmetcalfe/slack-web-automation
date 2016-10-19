class System

  def initialize(browser)
    @browser = browser
  end

  def account_page
    @account_page ||= AccountPage.new @browser
  end

  def login_page
    @login_page ||= LoginPage.new @browser
  end

  def sidebar_section
    @sidebar_section ||= SidebarSection.new @browser
  end
  
  def direct_messages_section
    @direct_messages_section ||= DirectMessagesSection.new @browser
  end

  def profile_page
    @profile_page ||= ProfilePage.new @browser
  end

  def channels_section
    @channels_section ||= ChannelsSection.new @browser
  end
end

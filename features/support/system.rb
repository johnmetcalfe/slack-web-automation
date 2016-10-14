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

  def direct_messages_section
    @direct_messages_section ||= DirectMessagesSection.new @browser
  end
end

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
end

class AccountPage < GenericPage

  def visit
    @driver.get "https://slack-web-automation.slack.com/account/settings"
  end

end

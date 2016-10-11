class SlackAccountPage < GenericPage

  def visit
    @driver.get "https://slack-web-automation.slack.com/account/settings"
  end

end

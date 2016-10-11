class SlackAccountPage < GenericPage

  def visit
    @driver.get "#{TestData.url}/account/settings"
  end

end

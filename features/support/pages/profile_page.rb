class ProfilePage < GenericPage

  def visit
    @driver.get "#{TestData.url}/messages/general/team/slacktestrob/"
  end

  



end

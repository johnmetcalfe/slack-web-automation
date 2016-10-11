class GenericPage

  def initialize(driver)
    @driver = driver
  end

  def url
    @driver.current_url
  end

  def title
    @driver.title
  end

  def source
    @driver.page_source
  end

end

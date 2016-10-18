class SidebarSection < GenericPage

  



  ##### DICTIONARY #####

  @@dictionary = {

  }

  def el(symbol)

    @driver.find_element(css: @@dictionary[symbol])

  end

  def els(symbol)

    @driver.find_elements(css: @@dictionary[symbol])

  end

end

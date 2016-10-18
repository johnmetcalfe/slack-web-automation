require 'selenium-webdriver'
require 'pry'
require 'rspec/expectations'
require 'securerandom'
require 'date'

require './features/support/pages/generic_page.rb'
Dir['./features/support/pages/*.rb'].each{|file| require file}
require './features/support/system.rb'

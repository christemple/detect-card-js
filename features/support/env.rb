require 'watir-webdriver'
require 'rspec'

Before do
  @browser = Watir::Browser.new :firefox
  @browser.goto "http://localhost:1337"
end

After do
  @browser.close
end
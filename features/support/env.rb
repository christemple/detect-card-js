require 'watir-webdriver'
require 'rspec'

$browser = Watir::Browser.new :chrome
$browser.goto "http://localhost:1337"

at_exit do
  $browser.close
end

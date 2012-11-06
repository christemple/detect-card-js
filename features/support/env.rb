require 'watir-webdriver'

Before do
  #profile = Selenium::WebDriver::Firefox::Profile.new
  #profile.native_events = false
  $browser = Watir::Browser.new :firefox#, :profile => profile
end

After do
  #$browser.close
end

## "before all"
#browser = Browser.new
#
#Before do
#  @browser = browser
#  @browser.goto "file///home/chris/dev/detect-card-js/index.html"
#end
#
## "after all"
#at_exit do
#  browser.close
#end

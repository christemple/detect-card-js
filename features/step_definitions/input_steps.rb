Given /^I enter Card number '(.*)'$/ do |card_number|
  @browser.text_field(:label, 'Card number:').set card_number
end
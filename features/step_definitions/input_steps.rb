Given /^I enter Card number '(.*)'$/ do |card_number|
  $browser.text_field(:label, 'Card number:').set card_number
end

When /^I hit the backspace key on Card number$/ do
  $browser.text_field(:label, 'Card number:').send_keys :backspace
end


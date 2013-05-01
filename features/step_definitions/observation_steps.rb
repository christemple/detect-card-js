Given /^I have yet to enter my card details$/ do
  #pending
end

Then /^my card type should be '(.*)'$/ do |card_type|
  @browser.span(id: 'type').text.should match card_type
end

Then /^I should not have a card type$/ do
  @browser.span(id: 'type').text.should be_empty
end
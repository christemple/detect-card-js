Given /^I have yet to enter my card details$/ do
  #pending
end

Then /^my card type should be '(.*)'$/ do |card_type|
  $browser.span(id: 'type').text.should match card_type
end

Then /^I should not have a card type$/ do
  $browser.span(id: 'type').text.should be_empty
end

Then /^I should not see 'not supported'$/ do
  $browser.text.should_not include 'not supported'
end

Then /^I should see 'not supported'$/ do
  $browser.text.should include 'not supported'
end

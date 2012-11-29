Given /^I have yet to enter my card details$/ do
  #pending
end

Then /^my card type should be '(.*)'$/ do |card_type|
  card = @browser.execute_script <<-JS
    return $('#card').data('card');
  JS
  card.should match card_type
end

Then /^I should see an area where my card type will be detected$/ do
  @browser.span(:class, 'card').exist?.should be_true
end

Then /^I should see '(.*)'$/ do |text|
  @browser.text.should include text
end

Then /^I should not see '(.*)'$/ do |text|
  @browser.text.should_not include text
end

Then /^I should see the card type container has class '(.*)'$/ do |card_type|
  @browser.span(:class, 'card').attribute_value("class").should include card_type
end

When /^I should see the card type container is empty$/ do
  @browser.span(:class, 'card').text.should be_empty
end
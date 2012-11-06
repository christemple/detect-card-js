Given /^I have included the .* script$/ do
  #pending
end

Then /^I should see that JQuery is available$/ do
  fail "JQuery not available" unless $browser.execute_script <<-JS
    typeof jQuery !== 'undefined'
  JS
end

Then /^I should see that JQuery has been extended with a 'detectCard' method$/ do
  fail "JQuery not extended with detectCard method" unless $browser.execute_script <<-JS
    typeof $.prototype.detectCard !== 'undefined'
  JS
end
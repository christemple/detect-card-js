Given /^I have included the .* script$/ do
  #pending
end

Then /^I should see that JQuery is available$/ do
  fail "JQuery not available" if @browser.execute_script <<-JS
    typeof jQuery == 'undefined'
  JS
end

Then /^I should see that JQuery has been extended with a 'detectCard' method$/ do
  fail "JQuery not extended with detectCard method" if @browser.execute_script <<-JS
    typeof $.prototype.pluginName == 'undefined'
  JS
end
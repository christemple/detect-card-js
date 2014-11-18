Given /^I have included the .* script$/ do
  #pending
end

Then /^I should see that JQuery is available$/ do
  fail "JQuery not available" if $browser.execute_script <<-JS
    return typeof jQuery == 'undefined'
  JS
end

Then /^I should see that JQuery has been extended with a 'detectCard' method$/ do
  fail "JQuery not extended with detectCard method" if $browser.execute_script <<-JS
    return typeof jQuery.prototype.detectCard == 'undefined'
  JS
end

Given /^I have added the detect card plugin$/ do
  $browser.execute_script(<<-JS)
    $("#card").detectCard({debug: true});
  JS
end

When /^I have added the plugin with supported types:$/ do |types|
  $browser.execute_script(<<-JS)
    $('#card').detectCard({debug: true, supported: #{types.raw.flatten}})
  JS
end

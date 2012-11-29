Given /^I have included the .* script$/ do
  #pending
end

Then /^I should see that JQuery is available$/ do
  fail "JQuery not available" if @browser.execute_script <<-JS
    return typeof jQuery == 'undefined'
  JS
end

Then /^I should see that JQuery has been extended with a 'detectCard' method$/ do
  fail "JQuery not extended with detectCard method" if @browser.execute_script <<-JS
    return typeof jQuery.prototype.detectCard == 'undefined'
  JS
end

Then /^I should see that my div placeholder contains '(.*)'$/ do |text|
  @browser.div(:class, 'card').text.should include text
end

When /^I should not see the plugins default span placeholder$/ do
  @browser.span(:class, 'card').exists?.should be_false
end

Given /^I have added the detect card plugin$/ do
  @browser.execute_script(<<-JS)
    $("#card").detectCard({debug: true});
  JS
end

Given /^I have created already created a div placeholder for the detected card type$/ do
  @browser.execute_script(<<-JS)
    $('body').append('<div class="card"></div>')
  JS
end

When /^I have added the plugin with '(.*)' as my custom class$/ do |klass|
  @browser.execute_script(<<-JS)
    $('#card').detectCard({debug: true, klass: '#{klass}'})
  JS
end

Then /^I should see that my custom '(.*)' placeholder contains '(.*)'$/ do |klass,text|
  @browser.div(:class, klass).text.should include text
end
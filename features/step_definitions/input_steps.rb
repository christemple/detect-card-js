Given /^I enter Card number '(.*)'$/ do |card_number|
  @browser.text_field(:label, 'Card number:').set card_number
end

When /^I hit the backspace key on Card number$/ do
  @browser.text_field(:label, 'Card number:').send_keys :backspace
end

Given /^I have set the plugin to prevent the default behaviour$/ do
  @browser.execute_script(<<-JS)
    $('#card').detectCard({preventDefault: true});
  JS
end

Given /^I have created already created a div placeholder for the detected card type$/ do
  @browser.execute_script(<<-JS)
    $('body').append('<div class="card"></div>')
  JS
end
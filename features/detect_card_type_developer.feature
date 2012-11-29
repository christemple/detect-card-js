Feature: As a developer I can customise the detect card plugin


  Scenario: Developer has added JQuery
    Given I have included the JQuery script
    Then I should see that JQuery is available


  Scenario: Developer has correctly extended the input element with the card detection plugin
    Given I have included the card detection plugin script
    And I have added the detect card plugin
    Then I should see that JQuery has been extended with a 'detectCard' method


  Scenario: Use the developers placeholder for displaying what card is detected if they already have one
    Given I have created already created a div placeholder for the detected card type
    And I have added the detect card plugin
    When I enter Card number '4'
    Then I should see that my div placeholder contains 'Visa'
    And I should not see the plugins default span placeholder


  Scenario: Developer can provide their own custom class for the detected card placeholder
    Given I have created already created a div placeholder for the detected card type with class 'card_type'
    And I have added the plugin with 'card_type' as my custom class
    When I enter Card number '4'
    Then I should see that my custom 'card_type' placeholder contains 'Visa'
    And I should not see the plugins default span placeholder

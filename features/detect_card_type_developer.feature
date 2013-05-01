Feature: As a developer I can customise the detect card plugin


  Scenario: Developer has added JQuery
    Given I have included the JQuery script
    Then I should see that JQuery is available


  Scenario: Developer has correctly extended the input element with the card detection plugin
    Given I have included the card detection plugin script
    And I have added the detect card plugin
    Then I should see that JQuery has been extended with a 'detectCard' method



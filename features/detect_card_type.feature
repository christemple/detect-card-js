Feature: Auto-detect a users credit/debit card type as they are entering it and provide feedback on what their card type is

  Scenario: Developer has added JQuery
    Given I have included the JQuery script
    Then I should see that JQuery is available

  Scenario: Developer has correctly extended the input element with the card detection plugin
    Given I have included the card detection plugin script
    Then I should see that JQuery has been extended with a 'detectCard' method

Feature: Auto-detect a users credit/debit card type as they are entering it and provide feedback on what their card type is

  Scenario: Developer has added JQuery
    Given I have included the JQuery script
    Then I should see that JQuery is available


  Scenario: Developer has correctly extended the input element with the card detection plugin
    Given I have included the card detection plugin script
    Then I should see that JQuery has been extended with a 'detectCard' method


  Scenario Outline: User enters their card details and has their card detected
    Given I enter Card number '<card_number>'
    Then I should see my card type is '<card_type>'
  Examples:
    | card_type  | card_number      |
    | visa       | 4751000011112222 |
    | mastercard | 5499000011112222 |


  Scenario: User enters their card number with spaces still has their card type detected
    Given I enter Card number '4751 0000 1111 2222'
    Then I should see my card type is 'visa'


  Scenario: User enters invalid characters and their card is no longer detected
    Given I enter Card number '4751'
    Then I should see my card type is 'visa'
    When I enter Card number '4751a'
    Then I should see my card type is 'none'



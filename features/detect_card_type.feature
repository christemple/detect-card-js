Feature: Auto-detect a users credit/debit card type as they are entering it and provide feedback on what their card type is

  Scenario: Developer has added JQuery
    Given I have included the JQuery script
    Then I should see that JQuery is available


  Scenario: Developer has correctly extended the input element with the card detection plugin
    Given I have included the card detection plugin script
    Then I should see that JQuery has been extended with a 'detectCard' method


  Scenario Outline: User enters their card details and has their card detected
    Given I enter Card number '<card_number>'
    Then my card type should be '<card_type>'
  Examples:
    | card_type  | card_number      |
    | visa       | 4751000011112222 |
    | mastercard | 5499000011112222 |


  Scenario: User enters their card number with spaces still has their card type detected
    Given I enter Card number '4751 0000 1111 2222'
    Then my card type should be 'visa'


  Scenario: User enters invalid characters and their card is no longer detected
    Given I enter Card number '4751'
    Then my card type should be 'visa'
    When I enter Card number '4751a'
    Then my card type should be 'none'


  Scenario: User has area next to their card input to show them what card is detected
    Given I have yet to enter my card details
    Then I should see an area where my card type will be detected


  Scenario: User can see that their credit/debit card is auto detected
    Given I enter Card number '4751'
    Then I should see 'visa'

#  Scenario: User who has not entered their card details should not see that 'none' was detected

  Scenario: Developer should see that the card span tag updates its class with the new card type
    Given I enter Card number '4'
    Then I should see the card type container has class 'visa'
    When I hit the backspace key on Card number
    Then I should see the card type container has class 'none'


  Scenario: User can see their detected card update as soon as possible when they use the delete keys
    Given I enter Card number '4'
    Then I should see 'visa'
    When I hit the backspace key on Card number
    Then I should see 'none'


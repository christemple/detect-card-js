Feature: Auto-detect a users credit/debit card type as they are entering it and provide feedback on what their card type is

  Background: Attach the detect card plugin to the card number input
    Given I have added the detect card plugin


  Scenario: User enters their Visa card details and has their card detected as a Visa
    Given I enter Card number '4751000011112222'
    Then my card type should be 'visa'


  Scenario Outline: User enters their MasterCard card details and has their card detected as a MasterCard
    Given I enter Card number '<card_number>'
    Then my card type should be 'mastercard'
  Examples:
    | card_number      |
    | 5199000011112222 |
    | 5299000011112222 |
    | 5399000011112222 |
    | 5499000011112222 |
    | 5599000011112222 |

  Scenario Outline: User enters their American Express card details and has their card detected as an American Express
    Given I enter Card number '<card_number>'
    Then my card type should be 'american_express'
  Examples:
    | card_number     |
    | 347700001111222 |
    | 377700001111222 |


  Scenario Outline: User enters their Discover card details and has their card detected as a Discover card
    Given I enter Card number '<card_number>'
    Then my card type should be 'discover'
  Examples:
    | card_number      |
    | 6522000011112222 |
    | 6011000011112222 |


  Scenario Outline: User enters their JCB card details and has their card detected as a JCB card
    Given I enter Card number '<card_number>'
    Then my card type should be 'jcb'
  Examples:
    | card_number      |
    | 213100001111222  |
    | 180000001111222  |
    | 3500000011112222 |

  Scenario Outline: User enters their Diners Club card details and has their card detected as a Diners Club card
    Given I enter Card number '<card_number>'
    Then my card type should be 'diners_club'
  Examples:
    | card_number    |
    | 30010000111122 |
    | 30110000111122 |
    | 30310000111122 |
    | 30410000111122 |
    | 30510000111122 |
    | 36990000111122 |
    | 38990000111122 |


  Scenario Outline: User will not see their detected credit/debit card if it has not been configured to do so
    Given I enter Card number '<card_number>'
    Then I should not see '<card_type>'
  Examples:
    | card_type        | card_number      |
    | Visa             | 4751000011112222 |
    | MasterCard       | 5499000011112222 |
    | American Express | 377700001111222  |
    | Discover         | 6011000011112222 |
    | JCB              | 213100001111222  |
    | Diners Club      | 30510000111122   |

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


  Scenario: Developer should see that the card span tag updates its class with the new card type
    Given I enter Card number '4'
    Then I should see the card type container has class 'visa'
    When I hit the backspace key on Card number
    Then I should see the card type container has class 'none'


  Scenario: User can see their detected card update as soon as possible when they use the delete keys
    Given I enter Card number '4'
    Then I should see 'Visa'
    When I hit the backspace key on Card number
    Then I should not see 'Visa'
    And I should see the card type container is empty


  Scenario: User enters a valid number that does not match any card type
    Given I enter Card number '5'
    Then my card type should be 'none'
    When I enter Card number '55'
    Then my card type should be 'mastercard'



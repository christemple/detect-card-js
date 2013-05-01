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

  Scenario Outline: User enters their Maestro card details and has their card detected as a Maestro
    Given I enter Card number '<card_number>'
    Then my card type should be 'maestro'
  Examples:
    | card_number      |
    | 5018000011112222 |
    | 5020000011112222 |
    | 5038000011112222 |
    | 5893000011112222 |
    | 6304000011112222 |
    | 6761000011112222 |
    | 6762000011112222 |
    | 6763000011112222 |
    | 0604000011112222 |


  Scenario Outline: User enters their American Express card details and has their card detected as an American Express
    Given I enter Card number '<card_number>'
    Then my card type should be 'american-express'
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
    Then my card type should be 'diners-club'
  Examples:
    | card_number    |
    | 30010000111122 |
    | 30110000111122 |
    | 30310000111122 |
    | 30410000111122 |
    | 30510000111122 |
    | 36990000111122 |
    | 38990000111122 |


  Scenario: User enters their card number with spaces still has their card type detected
    Given I enter Card number '4751 0000 1111 2222'
    Then my card type should be 'visa'


  Scenario: User enters invalid characters and their card is no longer detected
    Given I enter Card number '4751'
    Then my card type should be 'visa'
    When I enter Card number '4751a'
    Then I should not have a card type


  Scenario: User can see their detected card update as soon as possible when they use the delete keys
    Given I enter Card number '4'
    Then my card type should be 'visa'
    When I hit the backspace key on Card number
    Then I should not have a card type


  Scenario: User enters a valid number that does not match any card type
    Given I enter Card number '5'
    Then I should not have a card type
    When I enter Card number '55'
    Then my card type should be 'mastercard'
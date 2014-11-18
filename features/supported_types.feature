Feature: As a user I would like to only support a selection of card types

  Scenario: Customer only supports visa cards
    Given I have added the plugin with supported types:
      | visa |
    And I enter Card number '4751000011112222'
    Then I should not see 'not supported'
    When I enter Card number '5199000011112222'
    Then I should see 'not supported'



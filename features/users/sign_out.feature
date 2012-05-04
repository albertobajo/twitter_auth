Feature: Sign out

  Background:
    Given I am authenticated
  
  Scenario: Success
    When  I visit "/"
    And   I click on "Sign out"
    Then  I should be on "/"
    And   I should not see user info
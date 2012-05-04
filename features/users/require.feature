Feature: Require

  Scenario: Require user
    Given I am not authenticated
    When  I visit "/user"
    Then  I should see user info
    
  Scenario: Require no user
    Given I am authenticated
    When  I visit "/no_user"
    Then  I should be on "/"  
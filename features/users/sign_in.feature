Feature: Sign in
  
  Background:
    Given I am not authenticated
  
  Scenario: Success
    When  I visit "/twitter_auth/session/new"
    Then  I should be on "/"
    And   I should see user info
  
  Scenario: Require user
    When  I visit "/user"
    Then  I should see user info
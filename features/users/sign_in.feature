Feature: Sign in
  
  Background:
    Given I am not authenticated
  
  Scenario: Success
    When  I visit "/twitter_auth/session/new"
    Then  I should be on "/"
    And   I should see "Matt Harris"
    And   I should see "Going through and updating @twitterapi documentation"
    And   I should see "themattharris"
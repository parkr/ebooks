@config @corpus
Feature: _ebooks

  Scenario: Show version
    When I successfully run `ebooks version`
    Then the output should contain "ebooks version "

  Scenario: Generate a tweet
    When I generate a tweet
    Then I should see "words"

  @freezetime
  Scenario: Tweet a tweet
    When I send a tweet
    Then I should see something like "1970-01-01"
    And I should see something like "words"

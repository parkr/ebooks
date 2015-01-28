@config
@corpus
Feature: _ebooks

  Scenario: Show version
    When I successfully run `ebooks version`
    Then the output should contain "ebooks version "

  Scenario: Generate a tweet
    When I successfully run `ebooks generate -c config/ebooks`
    Then the output should contain "words"

  Scenario: Tweet a tweet
    Given I authenticate to Twitter
    When I successfully run the command `ebooks tweet -c config/ebooks`

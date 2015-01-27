@config
@corpus
Feature: _ebooks

  Scenario: Show version
    When I successfully run `ebooks version`
    Then the output should contain "ebooks version "

  Scenario: Generate a tweet
    When I successfully run `ebooks generate -c config/ebooks`
    Then the output should contain "words words words"

  @timecop
  Scenario: Tweet a tweet
    When I successfully run `ebooks tweet -c config/ebooks`
    Then the output should contain "1970-01-01 00:00:00 +0000:"

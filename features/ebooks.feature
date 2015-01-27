Feature: _ebooks

  Scenario: Show version
    When I successfully run `ebooks version`
    Then the output should contain "ebooks version "

  @config
  Scenario: Generate a tweet
    When I successfully run `ebooks generate -c config/ebooks`
    Then the output should contain "words words words"

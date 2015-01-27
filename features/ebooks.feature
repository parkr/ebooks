Feature: _ebooks

  Scenario: Show version
    When I successfully run `ebooks version`
    Then the output should contain "ebooks version "

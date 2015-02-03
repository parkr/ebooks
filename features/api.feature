@config @corpus
Feature: API

  Scenario: Generate a sentence and return it
    Given I initialise the config
    And I do Ebooks.generate(config)
    Then it should generate "words"

  Scenario: Generate a sentence and tweet it
    Given I initialise the config
    And I do Ebooks.tweet(config)
    Then it should send a tweet
    And it should give me "words"

  Scenario: Just tweet a sentence
    Given I initialise the config
    And I do Ebooks::Twitter.new(config[:twitter]).tweet('This is not a Markov tweet')

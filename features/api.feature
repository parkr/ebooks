@config @corpus
Feature: API

  Scenario: Generate a tweet
    Given I initialise the config
    And I do Ebooks.generate(config)
    Then it should generate "words"

    # Generate sentence and tweet it
  #  Ebooks.tweet(config)

    # Just tweet a sentence
  #  Ebooks::Twitter.new(config[:twitter]).tweet(my_sentence)

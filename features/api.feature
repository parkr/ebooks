@config @corpus
Feature: API

  Scenario: Generate a sentence and return it
    Given I initialise the config
    And I do Ebooks.generate(config)
    Then it should generate "words"

#  Scenario: Generate a sentence and tweet it
#    Given I initialise the config
#    And I do Ebooks.tweet(config)
#    Then it should send a tweet
#    And it should generate "words"
  #  Ebooks.tweet(config)

    # Just tweet a sentence
  #  Ebooks::Twitter.new(config[:twitter]).tweet(my_sentence)

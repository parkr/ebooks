# Ebooks

Generate your own horse_ebooks by [@busterbenson][] ([original gist][], [blog post][]) and compiled as a gem by [@parkr][]

[@busterbenson]: http://wayoftheduck.com/
[original gist]: https://gist.github.com/busterbenson/6695350
[blog post]: http://wayoftheduck.com/diy-horse-ebooks
[@parkr]: https://parkermoo.re

[![Build Status](http://img.shields.io/travis/parkr/ebooks.svg?style=flat-square)](https://travis-ci.org/parkr/ebooks)
[![Dependency Status](http://img.shields.io/gemnasium/parkr/ebooks.svg?style=flat-square)](https://gemnasium.com/parkr/ebooks)
[![Code Climate](http://img.shields.io/codeclimate/github/parkr/ebooks.svg?style=flat-square)](https://codeclimate.com/github/parkr/ebooks)
[![Gem Version](http://img.shields.io/gem/v/ebooks.svg?style=flat-square)](https://rubygems.org/gems/ebooks)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://parkr.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger)

## Installation

Add this line to your application's Gemfile:

    gem 'ebooks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ebooks

## Configuration

The `ebooks` executable and `Ebooks.read_config_file` will load in a yaml file
(`~/.ebooks` by default) if you want to set your own defaults.

Here are the gem's defaults:

```yaml
:tweets_csv_path: 'tweets.csv'
:corpus_path:     'markov_dict.txt'
:dictionary_name: 'dictionary'
:twitter:
  :consumer_key: ''
  :consumer_secret: ''
  :oauth_token: ''
  :oauth_token_secret: ''
```

## Usage

As an API:

```ruby
config = Ebooks.configuration(my_overrides)

# Generate a sentence and return it
Ebooks.generate(config)

# Generate sentence and tweet it
Ebooks.tweet(config)

# Just tweet a sentence
Ebooks::Twitter.new(config[:twitter]).tweet(my_sentence)
```

As an executable:

```bash
# To generate a new horse_ebooks sentence:
ebooks generate

# To generate a new sentence and tweet it:
ebooks tweet
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

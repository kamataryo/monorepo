# Monorepo

[![Gem Version](https://badge.fury.io/rb/monorepo.svg)](https://badge.fury.io/rb/monorepo)
[![Build Status](https://travis-ci.org/kamataryo/monorepo.svg?branch=master)](https://travis-ci.org/kamataryo/monorepo)

[under-development] Ruby based monorepo management tool like [Lerna](https://lernajs.io/).
Monorepo is a single repository which hosts multiple libraries.
You can arrange and integrate lint, test, release and other workflows with monorepo.
[Babel](https://babeljs.io/), [ESLint](https://eslint.org/) and other projects likely has plugin ecosystem take monorepo strategy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'monorepo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monorepo

## Usage

## `monorepo init`

Initialize Monorepo repo.

```shell
$ monorepo init --config_filename ./Monorepofile
$ monorepo init -c ./Monorepofile
$ monorepo init --gems specified_gem_folder
$ monorepo init -g specified_gem_folder
```

## `monorepo exec`

Exec commands in each package.

```shell
$ monorepo exec [COMMAND]
$ monorepo exec [COMMAND] -c ./Monorepofile
```

## `monorepo rake`

Run rake task in each package.

```shell
$ monorepo rake
$ monorepo rake [TASK]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kamataryo/monorepo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Monorepo project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kamataryo/monorepo/blob/master/CODE_OF_CONDUCT.md).

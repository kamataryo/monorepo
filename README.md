# Monorepo

[![Gem Version](https://badge.fury.io/rb/monorepo.svg)](https://badge.fury.io/rb/monorepo)
[![Build Status](https://travis-ci.org/kamataryo/monorepo.svg?branch=master)](https://travis-ci.org/kamataryo/monorepo)

Ruby based simple monorepo management tool like [Lerna](https://lernajs.io/).
Monorepo is a single repository which hosts multiple libraries.
You can arrange and integrate lint, test, release and other workflows with monorepo.
[Babel](https://babeljs.io/), [ESLint](https://eslint.org/) and other projects likely has plugin ecosystem take monorepo strategy.

## Installation

Install it yourself as:

```
$ gem install monorepo
```

## CLI reference

### `monorepo init`

Initialize your project for `monorepo`.

```shell
$ mkdir project_name
$ cd project_name
$ monorepo init
```

Or you can specify some options.

```shell
# Specify config file name
$ monorepo init --config_filename ./your_monorepo_config_file
$ monorepo init -c ./your_monorepo_config_file

# Specify gems directory name
$ monorepo init --gems specified_gem_dir
$ monorepo init -g specified_gem_dir

# Specify bundler option to use `bundle exec` or not.
# with `yes`, `y` or `true`, `bundle exec` are always attached with subcommand execution.
$ monorepo init -b YES
$ monorepo init --bundler YES
```

```shell
# result
$ tree .
.
├── Monorepofile
└── gems
```

You can add and arrange any numbers of child gems inside `./gems` directory.

```shell
$ tree .
.
├── Monorepofile
└── gems
    ├── gem-a
    └── gem-b
```

### `monorepo exec`

Exec commands in each child gems.

```shell
$ monorepo exec [COMMAND]
```

An example:

```shell
$ monorepo exec bundle init
$ tree .
.
├── Monorepofile
└── gems
    ├── gem-a
    │   └── Gemfile
    └── gem-b
        └── Gemfile
```

```shell
# use bundler option
$ .monorepo exec -b ls
executing `bundle exec ls` at gems/gem-a...
/path/to/monorepo/root/gems/gem-a
Gemfile Gemfile.lock
executing `bundle exec ls` at gems/gem-b...
/path/to/monorepo/root/gems/gem-b
Gemfile Gemfile.lock
```

### `monorepo rake`

Run rake task in each child gems.

```shell
$ monorepo rake        # with default rake task
$ monorepo rake [TASK] # with specified rake task
```

## Usage

```
$ monorepo rake spec
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

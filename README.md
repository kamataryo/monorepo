# Jwelbox
[![Build Status](https://travis-ci.org/kamataryo/jwelbox.svg?branch=master)](https://travis-ci.org/kamataryo/jwelbox)

Ruby based monolepo management tool like [Lerna](https://lernajs.io/).

# development

```shell
$ git clone git@github.com:kamataryo/jwelbox.git
$ cd jwelbox
$ bundle install
$ ./bin/jwelbox
```

# Commands

## `jwelbox init`

Initialize Jwelbox repo.

```shell
$ jwelbox init --config_filename ./Jwelboxfile
$ jwelbox init -c ./Jwelboxfile
$ jwelbox init --gems specified_gem_folder
$ jwelbox init -g specified_gem_folder
```

## `jwelbox exec`

Exec commands in each package.

```shell
$ jwelbox exec [COMMAND]
$ jwelbox exec [COMMAND] -c ./Jwelboxfile
```

## `jwelbox rake`

Run rake task in each package.

```shell
$ jwelbox rake
$ jwelbox rake [TASK]
```

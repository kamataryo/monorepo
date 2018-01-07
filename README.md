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

## `jwelbox bootstrap`

Bootstrap the packages in the current Jwelbox repo.

```shell
$ jwelbox bootstrap --config_filename ./Jwelboxfile.yml
$ jwelbox bootstrap -c ./Jwelboxfile.yml
$ jwelbox bootstrap --gems specified_gem_folder
$ jwelbox bootstrap -g specified_gem_folder
```

## `jwelbox exec`

Exec commands in each package.

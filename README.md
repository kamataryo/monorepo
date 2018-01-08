# Monorepo
[![Build Status](https://travis-ci.org/kamataryo/monorepo.svg?branch=master)](https://travis-ci.org/kamataryo/monorepo)

Ruby based monolepo management tool like [Lerna](https://lernajs.io/).

# development

```shell
$ git clone git@github.com:kamataryo/monorepo.git
$ cd monorepo
$ bundle install
$ ./bin/monorepo
```

# Commands

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

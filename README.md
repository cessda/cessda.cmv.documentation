# CESSDA Documentation Template

This repository is a template repository that can be forked to easily start creating documentation using [CESSDA's
Just The Docs theme](https://bitbucket.org/cessda/cessda.documentation.theme).

See <https://docs.tech.cessda.eu/platform/documentation_tooling.html> for detailed documentation on how to use this repository,
as well as descriptions on what the files in this repository do.

## Technical Implementation

The documentation is written in markdown files and compiled to html using [Jekyll](https://jekyllrb.com)
with the [CESSDA theme](https://rubygems.org/gems/jekyll-cessda-docs) based on the
[Just the docs](https://github.com/pmarsceill/just-the-docs) theme.

To get started locally, make sure to [have Ruby installed](https://jekyllrb.com/docs/installation/), then run

```shell
gem install jekyll bundler
bundle install
bundle exec jekyll serve --config _config.yml,_devsettings.yml
```

## Development

The documentation is written using Markdown files with Jekyll headers.
Coding follows the [Google Style Guide for Markdown](https://google.github.io/styleguide/docguide/style.html),
including ATX style headers and a maximal line lengths of 140 characters.

Style Guide compliance is checked with [markdownlint](https://github.com/markdownlint/markdownlint) by running

```shell
bundle exec rake lint
```

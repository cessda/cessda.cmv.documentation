# CESSDA Metadata Validator Documentation

This repository contains the documentation for the CESSDA Metadata Validator (CMV).

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

## Contributing

Please read [CONTRIBUTING](CONTRIBUTING.md) for details on our code of conduct,
and the process for submitting pull requests to us.

## Versioning

See [Semantic Versioning](https://semver.org/) for guidance.

## Changes

You can find the list of changes made in each release in the
[CHANGELOG](CHANGELOG.md) file.

## License

See the [LICENSE](LICENSE.txt) file.

## Citing

See the [CITATION](CITATION.cff) file.

# App name

TimeTabled

## App / Project Info

### URLs

Live site: https://team05.demo1.genesys.shefcompsci.org.uk/

Live database: https://db.genesys.shefcompsci.org.uk/demo/team05.php

### Description

Website for a student time management solution, created for the Genesys module.

## Development

### Significant Features / Technology

Mention anything significant outside of the standard stack...

### Getting Started

Clone the project, then:

- `cp config/database_sample.yml config/database.yml` and change credentials as appropriate.
- `bundle install`
- `yarn install`
- `rails db:setup`
- `rails s`
- `bin/webpack-dev-server` for live reloading.

### Testing

- Run specs with `rspec`
- Run Jest tests with `yarn test`
- Run static analysis with `brakeman`
- **Run all of the above with `rake`**

### CI

TODO: Fail if RSpec / Jest tests fail or if Brakeman finds a "medium" issue.

### Style Guide

A style guide is maintained for reference at `/style_guide`.

- Run Rubocop linting with `rubocop` or `rubocop -a` to auto-correct offenses
- Run Prettier linting with `yarn prettier --check .` or `yarn prettier --write .` to auto-correct offenses

### Deployment

_QA -> Demo -> Production_ using the `epi-deploy` gem.

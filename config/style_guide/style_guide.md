# Style Guide

## Ruby on Rails / HTML / HAML

Files relating to ruby on rails and HTML or HAML files follow the standard set out by the [Ruby style guide](https://rubystyle.guide/) and is enforced by [RuboCop](https://rubocop.org/).

In the `.rubocop.yml` file the following configurations have been set:

- Maximum line length of 200 characters
- Maximum method length of 20 lines
- Maximum block length of 400 lines
- [Style/Documentation](https://www.rubydoc.info/gems/rubocop/RuboCop/Cop/Style/Documentation) has been disabled
- A testing helper file 'spec/rails_helper.rb' is ignored.

## CSS / SCSS / JS

JavaScript and styling follow the standards and is enforced by [Prettier](https://prettier.io/)

No configuration has been made apart from excluding inapropriate files in `.prettierignore`
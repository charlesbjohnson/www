_default:
    @just --list --unsorted

# Print this help message
help: _default

# Build the project
build:
    @bin/bundle install
    @npm install

# Remove build artifacts
clean:
    @rm -rf vendor/

# Run the formatters
fmt: fmt-just fmt-rb fmt-css fmt-js

# Run the formatter for Just
fmt-just *OPTS:
    @just --unstable --fmt --quiet {{ OPTS }}

# Run the formatter for Ruby
fmt-rb *OPTS:
    @bin/rubocop --autocorrect {{ OPTS }}

# Run the formatter for CSS
fmt-css *OPTS:
    @npx prettier --parser css --write {{ OPTS }} site/**/*.css.*

# Run the formatter for JavaScript
fmt-js *OPTS:
    @npx prettier --parser typescript --write {{ OPTS }} site/**/*.js.*

# Generate the site
generate *OPTS:
    @bin/ssg {{ OPTS }}

# Run the linters
lint: lint-rb lint-css lint-js lint-md

# Run the linter for Ruby
lint-rb *OPTS:
    @bin/rubocop {{ OPTS }}

# Run the linter for CSS
lint-css *OPTS:
    @npx prettier --parser css --check {{ OPTS }} site/**/*.css.*

# Run the linter for JavaScript
lint-js *OPTS:
    @npx prettier --parser typescript --check {{ OPTS }} site/**/*.js.*

# Run the linter for Markdown
lint-md *OPTS:
    @vale --glob "!*style_guide.md.*" site/**/*.md.*

# Run the tests
test *OPTS:
    @bin/minitest {{ OPTS }}

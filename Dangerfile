# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Make it more obvious that a PR needs a summary
warn("Please provide a summary in the Pull Request description") if github.pr_body.length < 5

swiftlint.lint_files
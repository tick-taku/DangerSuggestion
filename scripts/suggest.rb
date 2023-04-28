require 'diff-suggester'

suggester = DiffSuggester::Suggester.new(
	repo: ENV["REPOSITORY"],
	pr_number: ENV["PR_NUMBER"],
	access_token: ENV["GITHUB_TOKEN"]
)
suggester.suggest

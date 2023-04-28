require 'diff-suggester'

suggester = DiffSuggester::Suggester.new(
	github.pr.repo.fullname,
	github.pr.number,
	ENV["DANGER_GITHUB_API_TOKEN"]
)
suggester.suggest

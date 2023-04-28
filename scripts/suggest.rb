require 'diff-suggester'

suggester = DiffSuggester::Suggester.new(
	repo: ENV["REPOSITORY"],
	pr_number: ENV["PR_NUMBER"],
	access_token: ENV["GITHUB_TOKEN"]
)
suggester.suggest

base_url = ENV["GITHUB_BASE_URL"]
puts base_url
puts base_url.blank?

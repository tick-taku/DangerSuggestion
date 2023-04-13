require 'git_diff'

diffs = ::GitDiff.from_string(`git diff --unified=0 HEAD`).files.map { |file|
  hunks = file.hunks.map { |hunk|
    addition_lines = hunk.lines.map do |line|
      line.content.scan(/^\+([^+].*)/)
    end
    target_line = hunk.range_info.original_range.start.to_i
    {'code': addition_lines.join('\n'), 'target': target_line}
  }
  {'file_path': file.b_path, 'hunks': hunks}
}

diffs.each do |diff|
  diff[:hunks].each do |hunk|
    markdown("```suggestion\n#{hunk[:code]}\n```", file: diff[:file_path], line: hunk[:target])
  end
end

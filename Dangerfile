require 'git_diff'

diffs = ::GitDiff.from_string(`git diff --unified=0 HEAD`).files.map { |file|
  hunks = file.hunks.map { |hunk|
    addition_lines = hunk.lines.select{|l| l.content.start_with?('+')}.map do |line|
      line.content.scan(/^\+([^+].*)/)
    end
    target_range = hunk.range_info.original_range
    target_line = "#{target_range.start}-#{target_range.start + target_range.number_of_lines}"
    {'code': addition_lines.select{ |line| !line.empty? }.join("\n"), 'target': target_line}
  }
  {'file_path': file.b_path, 'hunks': hunks}
}

diffs.each do |diff|
  diff[:hunks].each do |hunk|
    markdown("```suggestion\n#{hunk[:code]}\n```", file: diff[:file_path], line: hunk[:target])
  end
end

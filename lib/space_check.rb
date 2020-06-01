module SpaceCheck
  # rubocop:disable Metrics/CyclomaticComplexity
  def self.trailing_space_check(lines, errors)
    lines.each_with_index do |line, index|
      errors << "Trailing space found on line #{index + 1}." if line.end_with?("; \n")
    end
    errors
  end

  def self.indentation_check(lines, errors)
    lines.each_with_index do |line, index|
      next if line.start_with?('@') || line == "\n" || line.end_with?(",\n")
      next if ['{', '}'].any? { |needle| line.include? needle }

      num_of_spaces = line[/\A */].size
      if num_of_spaces < 2 || num_of_spaces > 2
        errors << "Indentation of 2 spaces expected.
          Found #{num_of_spaces} spaces instead on line #{index + 1}."
      end
    end
    errors
  end

  def self.space_before_bracket_check(lines, errors)
    lines.each_with_index do |line, index|
      next unless line.include?('{')

      errors << "There should be a space before curly bracket on line #{index + 1}" unless line =~ /[[:space:]]\{/
    end
  end

  def self.last_line_check(lines, errors)
    errors << 'Last line in the file should be empty.' unless lines.last.include? "\n"
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

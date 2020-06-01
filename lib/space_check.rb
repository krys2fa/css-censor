module SpaceCheck
  def self.trailing_space_check(lines, errors)
    lines.each_with_index do |line, index|
      errors << "  Error: Trailing space found on line #{index + 1}." if line.end_with?("; \n")
    end
    errors
  end

  def self.missing_semicolon_check(lines, errors)end

  def self.indentation_check(lines, errors)
    lines.each_with_index do |line, index|
      unless line.start_with?('@') || line.include?("{") || line.include?("}") || line == "\n"
        num_of_spaces = line[/\A */].size
        if num_of_spaces < 2 || num_of_spaces > 2
          errors << "  Error: Indentation of 2 spaces expected. Found #{num_of_spaces} spaces instead on line #{index + 1}."
        end
      end
    end
    errors
  end

  def self.last_line_check(lines, errors)
    errors << "  Error: Last line in the file should be empty." unless lines.last.include? "\n"
  end
end

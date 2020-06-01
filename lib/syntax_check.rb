module SyntaxCheck
  def self.missing_semicolon_check(lines, errors)
    lines.each_with_index do |line, index|
      next if line.include?('{') || line.include?('}') || line == "\n" || line.end_with?(",\n")

      errors << "Line does not end with ';' on line #{index + 1}." unless line.end_with?(";\n")
    end
    errors
  end
end

require_relative '../lib/censor.rb'
module Checker
  def self.check(file)
    errors = []
    lines = File.open(file).to_a

    if lines.size.positive?
      check = Censor.new
      check.last_line_check(lines, errors)
      check.indentation_check(lines, errors)
      check.trailing_space_check(lines, errors)
      check.space_before_bracket_check(lines, errors)
      check.missing_semicolon_check(lines, errors)
    end
    errors
  end
end

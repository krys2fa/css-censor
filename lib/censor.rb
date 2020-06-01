require_relative '../lib/space_check.rb'
module Censor
  def self.check(file)
    errors = []
    lines = File.open(file).to_a
    SpaceCheck.last_line_check(lines, errors)
    SpaceCheck.indentation_check(lines, errors)
    SpaceCheck.trailing_space_check(lines, errors)
  end
end

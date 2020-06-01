require_relative '../lib/space_check.rb'
module Censor
  def self.check(file)
  	errors = []
    SpaceCheck.last_line_check(file, errors)
  end
end

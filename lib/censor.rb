require_relative '../lib/space_check.rb'
require_relative '../lib/syntax_check.rb'
class Censor
  include SpaceCheck
  include SyntaxCheck
end

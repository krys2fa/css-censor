require_relative '../lib/syntax_check.rb'
require_relative '../lib/censor.rb'

describe SyntaxCheck do
  let(:check) { Censor.new }
  let(:line1) { ["padding: 10px\n"] }
  let(:line2) { ["padding: 10px;\n"] }
  let(:errors) { [] }

  describe 'missing_semicolon_check' do
    it 'returns error message if there is no semi-colon at the end of the line' do
      expect(check.missing_semicolon_check(line1, errors))
        .to eql(["Line does not end with ';' on line 1."])
    end

    it 'returns an empty array if there is a semi-colon at the end of the line ' do
      expect(check.missing_semicolon_check(line2, errors))
        .to eql([])
    end
  end
end

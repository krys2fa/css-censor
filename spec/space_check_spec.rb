require_relative '../lib/censor.rb'
require_relative '../lib/space_check.rb'

describe SpaceCheck do
  let(:check) { Censor.new }
  let(:lines1) { ['#head {', '}', "\n"] }
  let(:lines2) { ['#head {', '}'] }
  let(:line1) { ['.section {'] }
  let(:line2) { ['.section{'] }
  let(:errors) { [] }
  describe 'trailing_space_check' do
    it '' do
    end
  end

  describe 'indentation_check' do
    it '' do
    end
  end

  describe 'space_before_bracket_check' do
    it 'should return an empty array if there is a space before the opening bracket' do
      expect(check.space_before_bracket_check(line1, errors))
        .to eql([])
    end

    it 'should return an error message if there is no space before the opening bracket' do
      expect(check.space_before_bracket_check(line2, errors))
        .to eql(['There should be a space before curly bracket on line 1'])
    end
  end

  describe 'last_line_check' do
    it 'should return nil if the last line is blank' do
      expect(check.last_line_check(lines1, errors))
        .to eql(nil)
    end

    it 'should return an error message if the last line is not blank' do
      expect(check.last_line_check(lines2, errors))
        .to eql(['Last line in the file should be empty.'])
    end
  end
end

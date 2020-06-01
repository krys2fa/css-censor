require_relative '../lib/censor.rb'
require_relative '../lib/space_check.rb'

describe SpaceCheck do
  let(:check) { Censor.new }
  let(:good_code_lines) { ['#head {', '  padding: 10px;', '}', "\n"] }
  let(:bad_code_lines) { ['#head{', "padding: 10px; \n", '}'] }
  let(:errors) { [] }

  describe 'trailing_space_check' do
    it 'should return an empty array if there are no trailing spaces' do
      expect(check.trailing_space_check(good_code_lines, errors))
        .to eql([])
    end

    it 'should return an error message if trailing spaces are found' do
      expect(check.trailing_space_check(bad_code_lines, errors))
        .to eql(['Trailing space found on line 2.'])
    end
  end

  describe 'indentation_check' do
    it 'should return an empty array if there is an indentation of 2 spaces' do
      expect(check.indentation_check(good_code_lines, errors))
        .to eql([])
    end

    it 'should return an error message if there is no space before the opening bracket' do
      expect(check.indentation_check(bad_code_lines, errors))
        .to eql(["Indentation of 2 spaces expected.\n          Found 0 spaces instead on line 2."])
    end
  end

  describe 'space_before_bracket_check' do
    it 'should return an empty array if indentation of 2 spaces is not found' do
      expect(check.indentation_check(good_code_lines, errors))
        .to eql([])
    end

    it 'should return an error message if there is no space before the opening bracket' do
      expect(check.space_before_bracket_check(bad_code_lines, errors))
        .to eql(['There should be a space before curly bracket on line 1'])
    end
  end

  describe 'last_line_check' do
    it 'should return nil if the last line is blank' do
      expect(check.last_line_check(good_code_lines, errors))
        .to eql(nil)
    end

    it 'should return an error message if the last line is not blank' do
      expect(check.last_line_check(bad_code_lines, errors))
        .to eql(['Last line in the file should be empty.'])
    end
  end
end

require_relative '../lib/censor.rb'
require_relative '../lib/space_check.rb'

describe SpaceCheck do
  let(:check) { Censor.new }
  let(:lines1) { ['#head {', '}', "\n"] }
  let(:lines2) { ['#head {', '}'] }
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
    it '' do
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

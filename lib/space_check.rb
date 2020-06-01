module SpaceCheck
  def self.trailing_space_check(lines, errors)
    # lines_to_check = []
    # lines_to_skip = []

    # file = File.open(file, 'r')
    # num_of_lines = file.readlines.size
    # puts num_of_lines

    # File.foreach(file) do |line|

    #   if line.include? "{"
    #     lines_to_skip << line.chomp
    #   else
    #     lines_to_check << line.chomp
    #   end
    #   puts "skipping: #{lines_to_skip}"
    #   puts "checking: #{lines_to_check}"

    # end
    # count = 0
    # arr = []
    # lines.each_with_index {|i, e| arr << "#{e}: #{i}"}
    # lines.each { |line| count += 1 if line.end_with?("; \n") }
    lines.each_with_index do |line, index|
      errors << "  Error: Trailing space found on line #{index + 1}.\n" if line.end_with?("; \n")
    end
    # puts count
    # p arr
    errors
  end

  def self.missing_semicolon_check(lines, errors)end

  def self.indentation_check(lines, errors)
    # lines_to_check = []
    # lines_to_skip = []

    # File.foreach(file) do |line|

    # if line.include? '{'
    #   lines_to_skip << line.chomp
    # elsif line.include? '}'
    #   lines_to_skip << line.chomp
    # else
    #   lines_to_check << line.chomp
    # end
    # puts "skipping: #{lines_to_skip}"
    # puts "checking: #{lines_to_check}"

    # end

    # line_number = lines.find_index(lines.last)
    # puts lines.last
    # puts lines.count
    # puts "Line #{line_number + 1}: Last line in the file should be empty." if !lines.last.empty?
    # arr = [1, 2, 3]
    # puts arr.count
    # last_line_number = lines.count
    # lines.each_with_index {|i, e| puts "#{e}: #{i}"}
    # puts "Last line: #{lines.last}"

    # lines_to_check = []
    # exceptions = %w[ { } ]
    # lines.each { |line| lines_to_check << line unless line.start_with?('@') || line & exceptions.any? }
    # puts lines_to_check
  end

  def self.last_line_check(lines, errors)
    errors << "  Error: Last line in the file should be empty \n" unless lines.last.include? "\n"
  end
end

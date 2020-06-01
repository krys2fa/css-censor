module SpaceCheck

  def self.check(file)
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
  end

  def self.indentation_check(file)
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
  end

  def self.last_line_check(file, errors)
    lines = File.open(file).to_a
    # line_number = lines.find_index(lines.last)
    # puts lines.last
    # puts lines.count
    # puts "Line #{line_number + 1}: Last line in the file should be empty." if !lines.last.empty?
    # arr = [1, 2, 3]
    # puts arr.count
    # last_line_number = lines.count
    # lines.each_with_index {|i, e| puts "#{e}: #{i}"}
    # puts "Last line: #{lines.last}"
    errors << "Last line in the file should be empty" if !lines.last.include? "\n"
  end

end

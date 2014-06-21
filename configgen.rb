require 'optparse'

options = {:username => nil, :password => nil}

OptionParser.new do |opts|
  opts.banner = "Usage: pre_post_diff_v1.rb [options] devicefile"
  opts.on('-c', '--commands COMMANDS', 'File with list of commands') { |v| options[:commands] = v }
  opts.on('-n', '--number NUMBER', 'Number for loop') { |v| options[:number] = v }
  opts.on('-f', '--filename FILENAME', String, 'Output Filename') { |v| options[:filename] = v }
end.parse!

if options[:commands] == nil
  print 'Enter command file: '
    options[:commands] = gets.chomp
end

if options[:number] == nil
  print 'Enter Number: '
    options[:number] = gets.chomp
end

if options[:filename] == nil
  print 'Enter Filename: '
    options[:filename] = gets.chomp
end

@loop_commands = []
File.readlines(options[:commands]).map do |line|
  @loop_commands << line.chomp
end

@loop_number = options[:number].to_i

File.open options[:filename], 'w' do |f|
  for c in 2000..@loop_number
  	@loopnum = c
  	@loop_commands.each do |commands|
  		each_command = commands.sub("%", "#{@loopnum}")
    	f.puts each_command
    end
end
end

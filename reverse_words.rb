# Problem B. Reverse Words,
# https://code.google.com/codejam/contest/dashboard?c=351101#s=p1
#
# Use ruby 1.9.3, pass the input file as the first argument:
# ruby reverse_words.rb practice.in

file_in = ARGV[0]
file_out = file_in.sub('.in', '.out')
File.open(file_in, 'r') do |input|
  File.open(file_out, 'w') do |output|
    test_cases = input.readline.to_i
    1.upto(test_cases) do |test_case|
      words = input.readline.split(' ')
      reversed = words.reverse.join(' ')
      output << "Case ##{test_case}: #{reversed}\n"
    end
  end
end

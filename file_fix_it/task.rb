# Problem A. File Fix-it,
# https://code.google.com/codejam/contest/635101/dashboard#s=p0
#
# Use ruby 1.9.3, pass the input file as the first argument:
# ruby task.rb A-small-practice.in

require 'set'

def mkdir_count(existing, wanted)
  set = SortedSet.new
  existing.each do |path|
    paths(path).each { |subpath| set << subpath }
  end

  count = 0
  wanted.each do |path|
    paths(path).each do |subpath|
      unless set.include?(subpath)
        count += 1
        set << subpath
      end
    end
  end

  count
end

def paths(path, list = [])
  list.unshift(path)
  last_dash = path.rindex('/')
  last_dash.zero? ? list : paths(path[0..(last_dash - 1)], list)
end

file_in = ARGV[0]
file_out = file_in.sub('.in', '.out')
File.open(file_in, 'r') do |input|
  File.open(file_out, 'w') do |output|
    test_cases = input.readline.to_i
    1.upto(test_cases) do |test_case|
      n, m = input.readline.split(' ').map(&:to_i)
      existing = []
      n.times { existing << input.readline.chomp }
      wanted = []
      m.times { wanted << input.readline.chomp }
      output << "Case ##{test_case}: #{mkdir_count existing, wanted}\n"
    end
  end
end

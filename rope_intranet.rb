# Problem A. Rope Intranet,
# https://code.google.com/codejam/contest/619102/dashboard#s=p0
#
# Use ruby 1.9.3, pass the input file as the first argument:
# ruby rope_intranet.rb practice.in

def intersection_points(wires)
  wires.sort_by! { |a, _| a }
  points = 0
  0.upto(wires.length - 2) do |i|
    (i + 1).upto(wires.length - 1) do |j|
      points += 1 if wires[i][1] > wires[j][1]
    end
  end

  points
end

file_in = ARGV[0]
file_out = file_in.sub('.in', '.out')
File.open(file_in, 'r') do |input|
  File.open(file_out, 'w') do |output|
    test_cases = input.readline.to_i
    1.upto(test_cases) do |test_case|
      wires_count = input.readline.to_i
      wires = []
      wires_count.times { wires << input.readline.split(' ').map(&:to_i) }
      output << "Case ##{test_case}: #{intersection_points wires}\n"
    end
  end
end

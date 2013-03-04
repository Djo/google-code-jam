# Problem A. Minimum Scalar Product,
# http://code.google.com/codejam/contest/dashboard?c=32016#s=p0
#
# Use ruby 1.9.3, pass the input file as the first argument:
# ruby minimum_scalar_product.rb practice.in

def scalar_product(vector1, vector2)
  vector1.sort!
  vector2.sort! { |x, y| y <=> x }
  product = 0
  vector1.each_with_index do |number1, index|
    product += number1 * vector2[index]
  end

  product
end

file_in = ARGV[0]
file_out = file_in.sub('.in', '.out')
File.open(file_in, 'r') do |input|
  File.open(file_out, 'w') do |output|
    test_cases = input.readline.to_i
    1.upto(test_cases) do |test_case|
      input.readline
      vector1 = input.readline.split(' ').map(&:to_i)
      vector2 = input.readline.split(' ').map(&:to_i)
      product = scalar_product(vector1, vector2)
      output << "Case ##{test_case}: #{product}\n"
    end
  end
end

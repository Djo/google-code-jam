# Problem A. Rotate,
# https://code.google.com/codejam/contest/544101/dashboard#s=p0
#
# Use ruby 1.9.3, pass the input file as the first argument:
# ruby rotate.rb practice.in

def winners(board, join_k)
  length = board.length

  # Shift elements to the right
  # simulating rotating the board clockwise and taking gravity
  board.map! do |row|
    players = row.select { |el| el != '.' }
    ['.'] * (length - players.length) + players
  end

  winner = { 'B' => false, 'R' => false }

  # Shifted to the right board is checked in 4 directions
  0.upto(length - 1).each do |i|
    0.upto(length - 1).each do |j|
      player = board[i][j]
      next if player == '.' || winner[player]

      # Horizontally to the right
      if length - j >= join_k
        count = 1
        (j + 1).upto(length - 1).each do |hj|
          break if board[i][hj] != player
          count += 1
          if count == join_k
            winner[player] = true
            break
          end
        end
      end

      # Vertically to the bottom
      if length - i >= join_k
        count = 1
        (i + 1).upto(length - 1).each do |hi|
          break if board[hi][j] != player
          count += 1
          if count == join_k
            winner[player] = true
            break
          end
        end
      end

      # Diagonally to the left and bottom
      if length - i >= join_k && j + 1 >= join_k
        count = 1
        steps = [length - i, j + 1].min - 1
        1.upto(steps).each do |index|
          break if board[i + index][j - index] != player
          count += 1
          if count == join_k
            winner[player] = true
            break
          end
        end
      end

      # Diagonally to the right and bottom
      if length - i >= join_k && length - j >= join_k
        count = 1
        steps = [length - i, length - j].min - 1
        1.upto(steps).each do |index|
          break if board[i + index][j + index] != player
          count += 1
          if count == join_k
            winner[player] = true
            break
          end
        end
      end
    end
  end

  if winner['B'] && winner['R']
    'Both'
  elsif winner['B']
    'Blue'
  elsif winner['R']
    'Red'
  else
    'Neither'
  end
end

file_in = ARGV[0]
file_out = file_in.sub('.in', '.out')
File.open(file_in, 'r') do |input|
  File.open(file_out, 'w') do |output|
    test_cases = input.readline.to_i
    1.upto(test_cases) do |test_case|
      n, k = input.readline.split(' ').map(&:to_i)
      board = []
      n.times { board << input.readline.chomp.split('') }
      output << "Case ##{test_case}: #{winners board, k}\n"
    end
  end
end

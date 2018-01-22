

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,5,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [0,4,8]
]

board = [" "," "," "," "," "," "," "," ","X"]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
 board[index] = current_player
end

def position_taken?(board, index)
  if board[index] != ("X") && board[index] != ("O")
    return false
  elsif board[index] == ("X") || board[index] == ("O")
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !(position_taken?(board, index))
    return true
  else !index.between?(0, 8) || (position_taken?(board, index))
      return false
  end
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  current_player = board[index]
  if valid_move?(board, index)
    move(board, index, current_player)
  else
    turn(board)
  end
  display_board(board)
end

    WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    # ETC, an array for each win combination
    ]


  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    number = user_input.to_i
    number - 1 
  end

  def move(board, index, token)
    board[index] = token
  end

  def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end

  def valid_move?(board, index)
    index.between?(0,8) && !position_taken?(board, index)
  end

  def turn(board)
    puts "Please input a number between 1-9"
    user_input = gets.chomp
    index = input_to_index(user_input)
   if valid_move?(board, index)
        move(board, index, current_player(board))
        display_board(board)
   else 
    turn(board)
   end
  end

  def turn_count(board)
        board.count { |token| token == 'X' || token == 'O' }
  end


  def current_player(board)
    if turn_count(board).even?
        return "X"
    else 
        return "O"
    end
  end

  def won?(board)
    WIN_COMBINATIONS.find do |combo|
        board[combo[0]] == board[combo[1]] && 
        board[combo[1]] == board[combo[2]] && 
        position_taken?(board, combo[0])  
    end
  end

  def full?(board)
    board.all?{ |position| position == "X" || position == "O" }
  end

def draw?(board)
 !won?(board) && full?(board)
end

def over?(board)
    won?(board) || draw?(board) 
end

def winner(board)
    winner_combo = won?(board)
    if winner_combo
      board[winner_combo[0]]
    end
end


def play(board)
    turn(board) until over?(board) 
        if won?(board)
            puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
        puts "Cat's Game!"
    end
end





  
class TicTacToe

  #All winning combinations in tictactoe game

  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
  ]

  def initialize
    @board = Array.new(9, " ")
  end
# Board of the tic tac toe game
#
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

#Converts users input of the move they want to play to an index on the board

  def input_to_index(user_input)
    user_input.to_i - 1
  end


#Takes a users number and the board, and places the X or O char in the position player chose !!

  def move(index, current_player)
    @board[index] = current_player
  end

# checks if position is empty
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

# Validates a player move, checks if the move is available to be placed on a tic tac toe board(that is not already taken)
# It is an actual number???


  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


#Asks player for number, checks if it is valid and if not asks repeatedly.

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      players_move = current_player
      move(index, players_move)
      display_board
    else puts "Move not valid!!!\nPlease try again."
      turn
    end
  end



  def turn_count
    i = 0
    @board.each do |count|
      if count == "X" or  count == "O"
        i += 1
      end
    end
    i
  end


  def current_player
    num_turns = turn_count
    if num_turns % 2 == 0
      player = "X"
    else
      player = "O"
    end
    player
  end


  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif
      position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def full?
    @board.all? do |move| move  == "X" || move == "O"
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end


  def over?
    if full? || won? || draw?
      return true
    end
    false
  end


  def winner
    winner_move = won?
    if winner_move == false
      nil
    else
      if @board[winner_move[0]].include?("X")
        return "X"
      else
        return "O"
      end
    end
  end

  def play
    until over? == true do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
    puts "Cat's Game!"
    end
  end
end


play = TicTacToe.new
play.play

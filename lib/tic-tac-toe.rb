require 'pry'

class Board
  attr_reader :board
  
  # defines board with values 1-9
  def initialize
    @board = %w[1 2 3 4 5 6 7 8 9]
  end

  def winlines
    [
    board[0] == board[1] && board[1] == board[2] ? board[0] : nil,
    board[3] == board[4] && board[4] == board[5] ? board[3] : nil,
    board[6] == board[7] && board[7] == board[8] ? board[6] : nil,
    board[0] == board[3] && board[3] == board[6] ? board[0] : nil,
    board[1] == board[4] && board[4] == board[7] ? board[1] : nil,
    board[2] == board[5] && board[5] == board[8] ? board[2] : nil,
    board[0] == board[4] && board[4] == board[8] ? board[0] : nil,
    board[2] == board[4] && board[4] == board[6] ? board[2] : nil
    ]
  end

  def winner?
    !winlines.filter { |line| line }.empty?
  end

  def winning_token
    winner? ? winlines.filter { |line| line } : nil
  end

  def occupied?(position)
    !(1..9).to_a.include?(board[position])
  end

  def place_token(token, position)
    board[position - 1] = token
  end

  def draw
    puts " #{board[0]} | #{board[1]} | #{board[2]}"
    puts " ----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]}"
    puts " ----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]}"
  end
end

class Player
  
  def initialize(board, name, token)
    @name = name
    @token = token
    @board = board
  end

  def play_position
    loop do
    puts "Hey #{@name}, it's your turn. Please choose a position to put your token."
    position = gets.chomp.to_i
    unless @board.occupied?(position)
      @board.place_token(@token, position)
      break
    end 

    puts "This position is already taken, please choose a different position!"
    end
  end

end

class Game

  def initialize
    @board = Board.new
    @player1 = Player.new(@board, 'Player 1', 'X')
    @player2 = Player.new(@board, 'Player 2', 'O')
    start_game
  end

  def welcome
    puts "Welcome to tic-tac-toe! V2"
  end

  def start_game
    welcome
    gameloop
  end

  def gameloop
    loop do
      @player1.play_position
      @board.draw
    end
  end

end

binding.pry
















# require 'pry'

# class Player
#   attr_accessor :name, :token

#   def initialize(name, token)
#     @name = name
#     @token = token
#   end

# end

# class HumanPlayer < Player
#   def initialize
#   end

#   def pick_name(player_number)
#     puts "Hello Player #{player_number}, what's your name?"
#     gets.chomp
#   end

#   def pick_token(name)
#     puts "Hi #{name}, choose your token."
#     puts "Choose 1 for X or 2 for O"
#     choice = gets.chomp.to_i
#     if choice == 1
#       return "X"
#     elsif choice == 2
#       return "O"
#     else
#       puts "\nPlease make a valid choice. 1 or 2!"
#       pick_token(name)
#     end
#   end

#   def pick_opponent(name)
#     puts "Well #{name}, do you want to play against a human, or the computer?"
#     puts "Choose 1 for human or 2 for computer"
#     choice = gets.chomp.to_i
#     if choice == 1
#       return "Human"
#     elsif choice == 2
#       return "Computer"
#     else
#       puts "\nPlease make a valid choice. 1 or 2!"
#       pick_opponent(name)
#     end
#   end

# end

# class ComputerPlayer < Player
#   attr_accessor :name
  
#   def initialize
#     @name = "Computer"
#   end

#   def pick_token
#     player1.pick_token == "X" ? "O" : "X"
#   end
  
#   def play_turn
#   end

# end

# class Board
#   def initialize
#     @board = %w[1 2 3 4 5 6 7 8 9]
#     @winline1 = board[0] == board[1] && board[1] == board[2]
#     @winline2 = board[3] == board[4] && board[4] == board[5]
#     @winline3 = board[6] == board[7] && board[7] == board[8]
#     @winline4 = board[0] == board[3] && board[3] == board[6]
#     @winline5 = board[1] == board[4] && board[4] == board[7]
#     @winline6 = board[2] == board[5] && board[5] == board[8]
#     @winline7 = board[0] == board[4] && board[4] == board[8]
#     @winline8 = board[2] == board[4] && board[4] == board[6]
#     @winlines = [@winline1, @winline2, @winline3, @winline4, @winline5, @winline6, @winline7, @winline8]
#   end
# end

# binding.pry

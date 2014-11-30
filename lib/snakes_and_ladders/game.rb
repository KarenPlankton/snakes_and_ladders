module SnakesAndLadders
  class Game
    attr_reader :board, :players, :winner, :turn, :player

    def initialize(options)
      @board = options.fetch(:board)
      @players = options.fetch(:players, [])
      @turn = options.fetch(:turn, 0)
    end

    def play_turn
      return if over?

      # @player = players.at(turn % players.size)
      # roll = @player.roll_die
      # @turn += 1

      # if board.move(player, player.position, player.position_plus_last_roll)
      #   self.winner = player if won?
      # else
      #   self.winner = player if will_win?
      # end

      init_turn

      if board.move(player, player.position, player.position_plus_last_roll)
        self.winner = player if won?
      else
        self.winner = player if will_win?
      end
    end

    def over?
      !!winner
    end

    def simulate
      play_turn until over?
    end

    def will_win?
      player.position_plus_last_roll >= board.size
    end

    def won?
      player.position.equal?(board.size)
    end

  private

    def init_turn
      @player = players.at(turn % players.size)
      @player.roll_die
      @turn += 1
    end

    def winner=(player)
      @winner = player
      puts "Game over! #{winner} wins in #{winner.turns} turns. Congratulations!"
    end
  end
end

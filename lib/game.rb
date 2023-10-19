class Game
    attr_accessor :current_player, :status, :board, :players
  
    def initialize
      @player1 = Player.new("X")
      @player2 = Player.new("O")
  
      @players = [@player1, @player2]
      @board = Board.new
      @current_player = @player1
      @status = "en cours"
    end
  
    def turn
      @board.display_board  # Assuming that you meant the method named display_board in the Board class
  
      puts "#{@current_player.name}, c'est à toi de jouer (en gros faut que tu choisisse une case...) :"
      choice = gets.chomp.to_i
  
      if @board.valid_mov?(choice)
        @board.play_move(choice, @current_player.symbol)
      else
        puts "Erreur, réessaie."
        turn
        return
      end
  
      if @board.victory?
        @status = @current_player
      elsif @board.draw?
        @status = "match nul"
      else
        switch_player
        turn
      end
    end
  
    def new_round
      @board = Board.new
      @status = "en cours"
    end
  
    def game_end
      if @status.is_a?(Player)
        puts "#{status.name} a gagné !"
      elsif @status == "match nul"
        puts "Match nul."
      end
    end
  
    private
  
    def switch_player
      @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
    end
  end
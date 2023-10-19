class Board
    attr_accessor :cases
  
    def initialize
      @cases = []
      (1..9).each do |i|
        @cases << Boardcase.new(i)
      end
    end
  
    def display_board
      puts "    1   2   3"
      puts "  +---+---+---+"
      @cases.each_slice(3).with_index do |row, i|
        print "#{(i + 1 + 64).chr} |"
        row.each { |cell| print " #{cell.valeur == "X" || cell.valeur == "O" ? cell.valeur : cell.valeur.to_s} |" }
        puts "\n  +---+---+---+"
      end
    end
  
    def play_move(choice, symbol)
      if valid_mov?(choice)
        @cases[choice - 1].valeur = symbol
      end
    end
  
    def draw?
      @cases.all? { |boardcase| boardcase.valeur != "" }
    end
  
    def play_turn(player)
      puts "#{player.name}, choisissez une case (de 1 à 9) pour placer votre symbole (#{player.symbole}):"
      choice = gets.chomp.to_i
  
      if choice.between?(1, 9) && @cases[choice - 1].valeur.empty?
        @cases[choice - 1].valeur = player.symbole
        puts "#{player.name} a placé son symbole (#{player.symbole}) dans la case #{choice}."
      else
        puts "Choix invalide. Veuillez réessayer."
        play_turn(player)
      end
    end
  
    def valid_mov?(choice)
      return false unless choice.is_a?(Integer) && choice.between?(1, 9)
      @cases[choice - 1].valeur.empty?
    end
  
    def victory?
      winning_combinations = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
      ]
      winning_combinations.each do |combo|
        value = combo.map { |index| @cases[index].valeur }
        return true if value.all?("X") || value.all?("O")
      end
      false
    end
  end
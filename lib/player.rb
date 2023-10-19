class Player
    attr_accessor :name, :symbol
  
    def initialize(symbol)
      @symbol = symbol
      puts "Joueur #{@symbol}, quelle est votre nom :"
      @name = gets.chomp
    end
  end
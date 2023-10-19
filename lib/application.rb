require_relative "board"
require_relative "boardcase"
require_relative "game"
require_relative "player"
require_relative "show"

class Application
  def initialize
    @game = Game.new
  end

  def perform
    puts "Bienvenue dans le Morpion des ténèbres !"

    while @game.status == "en cours"
      @game.turn
    end

    @game.game_end
  end
end

app = Application.new
app.perform

puts "end of file"
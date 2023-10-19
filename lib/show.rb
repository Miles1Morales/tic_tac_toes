=begin
class Show
    attr_accessor :board, :boardcase, :game
    def initialize(board)
@board = board
@board_case = board_case
    end

    def show_board(board)
        puts "Voici l'état du plateau"
           

        @board.cases.each_slice(3) do |row|
            row_str = row.map { |board_case| board_case.valeur.center(5)}.join("|")
            separator = "-" * (row_str.length + 4)
            puts row_str
            puts separator
        end
    end
end
=end
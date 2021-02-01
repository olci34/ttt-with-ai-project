class Game
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        self.board = board
        self.player_1 = player_1 
        self.player_2 = player_2 
    end

    def current_player
        self.board.turn_count.even? ? self.player_1 : self.player_2
    end

    def won?
        WIN_COMBINATIONS.any? do |win_combo|
            if self.board.taken?("#{win_combo[0]+1}") && self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && self.board.cells[win_combo[1]] == self.board.cells[win_combo[2]]
                return win_combo
            end
        end
        false
    end

    def draw?
        self.board.full? && !self.won?
    end

    def over?
        self.draw? || self.won? ? true : false
    end

    def winner
        if self.won?
        win_combo = self.won?
        self.board.cells[win_combo[0]]
        end
    end

    def turn
        move = self.current_player.move(self.board)
        if !self.board.valid_move?(move)
            self.turn
        else
            self.board.update(move, self.current_player)
            puts "\n\n"
        end
    end

    def play
        self.board.display
        puts "\n\n"
        until self.over?
            self.turn
        end
        if self.won?
            puts "Congratulations #{self.winner}!" 
        elsif self.draw?
            puts "Cat's Game!"
        end
    end



end
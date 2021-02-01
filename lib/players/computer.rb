module Players

    class Computer < Player
        def move(board)
            valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            random_move = valid_moves.sample
            if !board.taken?(random_move)
                puts "Computer move: #{random_move}"
                board.update(random_move, self)
                random_move
            else
                self.move(board)
            end
        end
    end

end
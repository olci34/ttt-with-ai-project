
class Board

    attr_accessor :cells

    def initialize
        @cells = Array.new(9, " ")
    end

    def reset!
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(slot)
        index = slot.to_i - 1
        self.cells[index]
    end

    def full?
        true unless self.cells.any?(" ")
    end

    def turn_count
        self.cells.select {|cell| cell == "X" || cell == "O"}.count
    end

    def taken?(slot)
        self.position(slot) == " " ? false : true
    end

    def valid_move?(slot)
        !self.taken?(slot) && (1..9).include?(slot.to_i)
    end

    def update(slot, player)
        self.cells[slot.to_i - 1] = player.token
        self.display
    end
end



    
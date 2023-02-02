# Visual game board
class Board
  attr_accessor :grid, :tokens, :spaces

  def initialize
    @grid = [
      '· ╌╌╌╌╌╌╌ · ╌╌╌╌╌╌╌ · ╌╌╌╌╌╌╌ ·',
      '┆         ┆         ┆         ┆',
      '┆    a    ┆    b    ┆    c    ┆',
      '┆         ┆         ┆         ┆',
      '· ╌╌╌╌╌╌╌ · ╌╌╌╌╌╌╌ · ╌╌╌╌╌╌╌ ·',
      '┆         ┆         ┆         ┆',
      '┆    d    ┆    e    ┆    f    ┆',
      '┆         ┆         ┆         ┆',
      '· ╌╌╌╌╌╌╌ · ╌╌╌╌╌╌╌ · ╌╌╌╌╌╌╌ ·',
      '┆         ┆         ┆         ┆',
      '┆    g    ┆    h    ┆    i    ┆',
      '┆         ┆         ┆         ┆',
      '· ╌╌╌╌╌╌╌ · ╌╌╌╌╌╌╌ · ╌╌╌╌╌╌╌ ·'
    ]
    @tokens = ["\e[31m✕\e[0m", "\e[32m⦿\e[0m"]
    @spaces = {
      'a' => @grid[2].chars[5],
      'b' => @grid[2].chars[15],
      'c' => @grid[2].chars[25],
      'd' => @grid[6].chars[5],
      'e' => @grid[6].chars[15],
      'f' => @grid[6].chars[25],
      'g' => @grid[10].chars[5],
      'h' => @grid[10].chars[15],
      'i' => @grid[10].chars[25]
    }
  end

  def parse_spaces(current_game)
    picks0 = current_game.players[0].picked_spaces
    picks1 = current_game.players[1].picked_spaces
    picks0_regex = /[#{picks0}]/ unless picks0 == ''
    picks1_regex = /[#{picks1}]/ unless picks1 == ''
    @spaces.map do |k,v|
      if k =~ picks0_regex
        [k, @tokens[0]]
      elsif k =~ picks1_regex
        [k, @tokens[1]]
      else
        [k, "\e[3m#{v.upcase}\e[23m"]
      end
    end.to_h
  end

  def display_grid(current_game)
    @grid.each do |row|
      spaces_regex = /[#{@spaces.values.join}]/
      if row =~ spaces_regex
        puts "#{row.gsub(spaces_regex, parse_spaces(current_game))}\n"
      else
        puts "#{row}\n"
      end
    end
  end
end

# Core game
class Core
  attr_accessor :players, :available_spaces, :winning_sets, :turn

  def initialize
    @players = []
    @available_spaces = %w[a b c d e f g h i]
    @winning_sets = %w[abc def ghi adg beh cfi aei ceg]
    @turn = 0
  end

  def create_player(name)
    @players << Player.new(name)
  end

  def run_player_turn(player, player_pick)
    player.plays(player_pick)
    @available_spaces -= [player_pick]
  end

  def toggle_turn
    @turn.zero? ? (@turn = 1) : (@turn = 0)
  end
  # 1 : 0

  def still_ongoing?
    winner?.nil? && @available_spaces.any? ? true : false
  end
  # true : false

  def winning?(player)
    @winning_sets.each do |set|
      return true if (set.chars & player.picked_spaces.chars).sort == set.chars.sort
    end
    false
  end
  # true : false

  def winner?
    @players.each do |player|
      return player if winning?(player)
    end
    nil
  end
  # player : nil
end

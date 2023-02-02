# Game
class Game
  attr_accessor :players, :available_spaces, :winning_sets, :turn

  def initialize(*players_names)
    raise ArgumentError, 'Too many arguments (max. 2)' if players_names.length > 2

    @players = []
    players_names.each { |name| @players << Player.new(name) }
    @available_spaces = %w[a b c d e f g h i]
    @winning_sets = %w[abc def ghi adg beh cfi aei ceg]
    @turn = 0
  end

  def fetch_pick
    @available_spaces.sample
  end

  def run_player_turn(player)
    pick = fetch_pick
    player.plays(pick)
    @available_spaces -= [pick]
    puts "#{player.name} played #{pick}"
    puts "now the available spaces are #{@available_spaces}"
  end

  def toggle_turn
    @turn.zero? ? (@turn = 1) : (@turn = 0)
  end

  def still_ongoing?
    winner?.nil? && @available_spaces.any? ? true : false
  end

  def winning?(player)
    @winning_sets.each do |set|
      return true if (set.chars & player.picked_spaces.chars).sort == set.chars.sort
    end
    false
  end

  def winner?
    @players.each do |player|
      return player if winning?(player)
    end
    nil
  end
end

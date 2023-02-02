# Course of play with players' CLI interactions & view
class Game < Core
  attr_accessor :board

  def initialize
    super
    @board = Board.new
  end

  def set_players
    2.times do
      create_player(Prompt.name(@turn))
      toggle_turn
    end
  end

  def secure(pick)
    case pick
    when /[#{@available_spaces.join}]/
      pick
    when 'q'
      system('clear') || system('cls')
      exit
    else
      @available_spaces.sample
    end
  end

  def run_all_turns
    loop do
      system('clear') || system('cls')
      @board.display_grid(self)
      run_player_turn(@players[@turn], secure(Prompt.pick(@players[@turn].name)))
      toggle_turn
      break unless still_ongoing?
    end
  end

  def show_results
    system('clear') || system('cls')
    @board.display_grid(self)
    if winner?.nil?
      puts "\n\nNo winner :("
    else
      puts "#{winner?.name} is the winner! Congrats :)"
    end
  end
end

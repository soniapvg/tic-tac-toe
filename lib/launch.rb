module Launch
  def self.new_game
    loop do
      run(Game.new)
      break unless another?
    end
  end
  
  def self.another?
    if Prompt.replay? == 'yes'
      true
    else
      system('clear') || system('cls')
      exit
    end
  end

  def self.run(game)
    game.set_players
    system('clear') || system('cls')
    game.run_all_turns
    game.show_results
  end
end

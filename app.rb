require 'bundler'
Bundler.require

Dir['lib/*/*'].sort.each { |file| require_relative file }

def perform
  ttt = Game.new('José', 'Joséphine')
  loop do
    ttt.run_player_turn(ttt.players[ttt.turn])
    ttt.toggle_turn
    break unless ttt.still_ongoing?
  end
  puts ttt.winner?.nil? ? 'no winner' : "#{ttt.winner?.name} won playing #{ttt.winner?.picked_spaces}"
end

perform

require 'bundler'
Bundler.require

Dir['lib/*'].sort.each { |file| require_relative file }

loop do
  case Prompt.welcome
  when 'ok'
    Launch.new_game
  when 'q'
    system('clear') || system('cls')
    exit
  else
    next
  end
end

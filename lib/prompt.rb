module Prompt
  def self.welcome
    system('clear') || system('cls')
    puts '  _______       ______           ______        '
    puts ' /_  __(_)___  /_  __/__ _____  /_  __/__  ___ '
    puts '  / / / / __/   / / / _ `/ __/   / / / _ \/ -_)'
    puts ' /_/ /_/\__/   /_/  \_,_/\__/   /_/  \___/\__/ '
    puts "\n\nPress [ok] to play"
    puts 'You can exit the game anytime by pressing [q]'
    print "\n> "
    gets.chomp
  end

  def self.name(turn)
    system('clear') || system('cls')
    puts "\nEnter a name for player #{turn + 1}:"
    print '> '
    gets.chomp
  end

  def self.pick(name)
    puts "\n\n#{name}, pick a letter"
    print '> '
    gets.chomp
  end

  def self.replay?
    puts "\nPlay again? [yes] or [no]"
    print '> '
    gets.chomp
  end
end

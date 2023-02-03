module Prompt
  TTT_KEYBOARD_STYLE = [
    ' ____ ____ ____ _________ ____ ____ ____ _________ ____ ____ ____ ',
    '||T |||i |||c |||       |||T |||a |||c |||       |||T |||o |||e ||',
    '||__|||__|||__|||_______|||__|||__|||__|||_______|||__|||__|||__||',
    '|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|',
  ].freeze

  TTT_ITALIC_STYLE = [
    '  _______       ______           ______        ',
    ' /_  __(_)___  /_  __/__ _____  /_  __/__  ___ ',
    '  / / / / __/   / / / _ `/ __/   / / / _ \/ -_)',
    ' /_/ /_/\__/   /_/  \_,_/\__/   /_/  \___/\__/ '
  ].freeze

  def self.welcome
    system('clear') || system('cls')
    puts "\e[31m#{TTT_ITALIC_STYLE.join("\n")}\e[0m"
    puts "\n\nPress \e[32m[ok]\e[0m to play"
    puts "You can exit the game anytime by pressing \e[32m[q]\e[0m"
    print "\n▶︎ "
    gets.chomp
  end

  def self.name(turn)
    system('clear') || system('cls')
    puts "\nEnter a name for player #{turn + 1}:"
    print '▶︎ '
    gets.chomp
  end

  def self.pick(name)
    puts "\n\n✭ \e[4m#{name}\e[24m ✭"
    puts "\nPick one available letter on the board"
    puts "\e[3m(otherwise, it will be randomly picked)\e[23m"
    print '▶︎ '
    gets.chomp
  end

  def self.replay?
    puts "\nPlay again? \e[32m[yes]\e[0m or \e[32m[no]\e[0m"
    print '▶︎ '
    gets.chomp
  end
end

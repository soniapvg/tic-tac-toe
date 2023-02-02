# Player
class Player
  attr_accessor :name, :picked_spaces

  def initialize(name_init)
    @name = name_init
    @picked_spaces = ''
  end

  def plays(pick)
    @picked_spaces << pick
  end
end

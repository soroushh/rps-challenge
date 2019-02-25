class Game
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @game_hash = { player_1.movement => player_1.name,
      player_2.movement => player_2.name }
    @game_movements = [player_1.movement, player_2.movement]
  end

  def winner_term
    return "The game is equal" if @game_movements.uniq.size == 1
    return "#{@game_hash[the_winner_movement]} won the game"
  end

  def self.player_1_name
    @player_1_name ||= []
  end

  def self.player_2_name
    @player_2_name ||= []
  end

  def self.player_1_movement
    @player_1_movement ||= []
  end

  def self.player_2_movement
    @player_2_movement ||= []
  end

  private
  def the_winner_movement
    return "paper" if @game_movements.sort == ["paper", "rock"]
    return "scissors" if @game_movements.sort == ["paper", "scissors"]
    return "rock" if @game_movements.sort == ["rock", "scissors"]
  end
end

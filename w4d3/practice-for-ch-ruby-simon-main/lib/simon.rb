class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless @game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    seq
  end

  def require_sequence
    sequence = gets.chomp.split(" ")
    if sequence != seq
      @game_over = true
    end

  end

  def add_random_color
    num = rand(0..3)
    @seq << COLORS[num]
  end

  def round_success_message
    puts "Round #{@sequence_length} success"
  end

  def game_over_message
    puts "You lost"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

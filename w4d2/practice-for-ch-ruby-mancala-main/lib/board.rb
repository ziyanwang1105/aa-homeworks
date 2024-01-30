

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){Array.new()}
    @name1 =name1
    @name2 =name2
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each do |i|
      unless i == 6 || i == 13
        @cups[i] += [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless (0..13).to_a.include?(start_pos)
    raise 'Starting cup is empty' if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos].length

    point_pit = current_player_name == @name1 ? 6 : 13
    @cups[start_pos] = []
    i = 1
    while stone_count > 0
      cup_indx = (start_pos + i) % 14
      if cup_indx != (point_pit + 7) % 14
        @cups[cup_indx] << :stone
        stone_count -=1
      end
      i +=1
    end
    self.render
  ending_cup_idx = (start_pos + i - 1) % 14
  next_turn(ending_cup_idx)


  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    cup = @cups[ending_cup_idx]
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cup.length == 1
    return ending_cup_idx if cup.length > 1



  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side_1 = @cups[0..5]
    side_2 = @cups[7..12]
    side_1.all?{|cup| cup.length == 0} || side_2.all?{|cup| cup.length == 0}
  end

  def winner
    eval = @cups[6] <=>@cups[13]
    case eval
      when 1
        return @name1
      when 0
        return :draw
      when -1
        return @name2
    end
  end
end

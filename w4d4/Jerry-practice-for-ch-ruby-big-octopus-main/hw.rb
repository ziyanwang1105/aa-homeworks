fish_group = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh',
'fiiiissshhhhhh']


def sluggish_octupus(arr)

    arr.each do |ele1|
        if arr.all?{|ele2| ele1.length >= ele2.length}
            return ele1
        end
    end

end

p sluggish_octupus(fish_group)

def merge_sort (array, &prc)
    return array if array.length <= 1

    mid_idx = array.length / 2
    merge(
      merge_sort(array.take(mid_idx), &prc),
      merge_sort(array.drop(mid_idx), &prc),
      &prc
    )
  end

  # NB: In Ruby, shift is an O(1) operation. This is not true of all languages.
  def merge(left, right, &prc)
    merged_array = []
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless block_given?
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end

  def dominant_octopus(arr)

    merge_sort(arr){|ele1, ele2| ele1.length <=> ele2.length}[-1]
  end

  p dominant_octopus(fish_group)

def clever_octupus(arr)
    arr.inject{|acc, ele| acc.length > ele.length ? acc : ele}

end


p clever_octupus(fish_group)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]

def slow_dance(str, array)

    array.each_with_index do |ele, i|
        if str == ele
            return i
        end
    end
end

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

new_tiles = {}
tiles_array.each_with_index do |ele, i|
    new_tiles[ele] = i
end

def fast_dance(str, hash)
    hash[str]
end

p fast_dance("up", new_tiles)
p fast_dance("right-down", new_tiles)

class GraphNode

    attr_reader :val
    attr_accessor :neighbors
    def initialize(val)

        @val = val
        @neighbors = []
    end


end

def bfs(starting_node, target_value)

    queue = [starting_node]
    searched_node = []

    until queue.empty?
        first_ele = queue.shift
        searched_node << first_ele
        return first_ele if first_ele.val == target_value
        first_ele.neighbors.each do |node|
            queue << node unless searched_node.include?(node)
        end

    end
    nil

end


if __FILE__ == $PROGRAM_NAME

    a = GraphNode.new('a')
    b = GraphNode.new('b')
    c = GraphNode.new('c')
    d = GraphNode.new('d')
    e = GraphNode.new('e')
    f = GraphNode.new('f')
    a.neighbors = [b, c, e]
    c.neighbors = [b, d]
    e.neighbors = [a]
    f.neighbors = [e]
    # p bfs(a, "b")
    p bfs(a, "f")
end

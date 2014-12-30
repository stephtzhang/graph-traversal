def max_int
  machine_bytes = ['banana'].pack('p').size
  machine_bits = machine_bytes * 8
  2**(machine_bits-1)
end

MAX_INT = max_int

class Graph
  attr_reader :edges

  def initialize(graph_info, directed)
    @edges = {}
    @directed = directed
    @discovered = set_false_hash
    make_edges(graph_info)
  end

  def make_edges(graph_info)
    graph_info.each do |connection|
      add_edge(connection[0], connection[1], @directed)
    end
  end

  def add_edge(x, y, pair_processed)
    if @edges[x]
      @edges[x] << y
    else
      @edges[x] = [y]
    end

    add_edge(y, x, true) unless pair_processed
  end

  def dijkstra(start_node)
    @discovered = set_false_hash
    distance = set_distance_hash

    distance[start_node] = 0

  end

  def breadth_first_search(start_node)
    @discovered = set_false_hash
    queue = []

    queue.unshift(start_node)

    while queue.length > 0
      current_node = queue.pop

      puts current_node
      # process current_node here (early)

      adjacent_nodes = @edges[current_node]
      adjacent_nodes.each do |adjacent_node|
        unless @discovered[adjacent_node]
          @discovered[adjacent_node] = true
          queue.unshift(adjacent_node)
        end
      end
      @discovered[current_node] = true
      # process current_node here (late)
    end
  end

  def depth_first_search(start_node)
    @discovered = set_false_hash
    stack = []

    stack.unshift(start_node)

    while stack.length > 0
      current_node = stack.shift

      puts current_node
      # process current_node here (early)

      adjacent_nodes = @edges[current_node]
      adjacent_nodes.each do |adjacent_node|
        unless @discovered[adjacent_node]
          @discovered[adjacent_node] = true
          stack.unshift(adjacent_node)
        end
      end
      @discovered[current_node] = true
      # process current_node here (late)
    end
  end

  def recursive_dfs(start_node)
    @discovered = set_false_hash
    search_all_nodes(start_node)
  end

  def search_all_nodes(node)
    puts node
    # process node here (early)

    @discovered[node] = true
    adjacent_nodes = @edges[node]
    adjacent_nodes.each do |adjacent_node|
      unless @discovered[adjacent_node]
        @discovered[adjacent_node] = true
        search_all_nodes(adjacent_node)
      end
    end
    # process node here (late)
  end

  def set_distance_hash
    distance_hash = {}
    @edges.each do |node, connection|
      distance_hash[node] = MAX_INT
    end
    distance_hash
  end

  def set_false_hash
    false_hash = {}
    @edges.each do |node, connection|
      false_hash[node] = false
    end
    false_hash
  end
end

graph_info = [[1, 2], [1, 3], [1, 4], [3, 4], [4, 5], [2,7], [5,6], [8,9]]
graph = Graph.new(graph_info, false)
graph.depth_first_search(1)
puts ""
graph.recursive_dfs(1)
puts ""
graph.breadth_first_search(1)
puts ""
graph.breadth_first_search(8)
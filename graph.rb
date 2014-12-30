def max_int
  machine_bytes = ['banana'].pack('p').size
  machine_bits = machine_bytes * 8
  2**(machine_bits-1)
end

MAX_INT = max_int

class EdgeNode
  attr_reader :connected_node, :weight

  def initialize(connected_node, weight = 0)
    @connected_node = connected_node
    @weight = weight
  end
end

class Graph
  attr_reader :edges

  def initialize(graph_info, directed)
    @edges = {}
    @directed = directed
    @discovered = {}
    make_edges(graph_info)
  end

  def make_edges(graph_info)
    graph_info.each do |connection|
      add_edge(connection[0], connection[1], connection[2], @directed)
    end
  end

  def add_edge(x, y, weight, pair_processed)
    if @edges[x]
      @edges[x] << EdgeNode.new(y, weight)
    else
      @edges[x] = [EdgeNode.new(y, weight)]
    end

    add_edge(y, x, weight, true) unless pair_processed
  end

  # TODO: add weight to nodes
  # and update adjacent_node.weight wording
  # if necessary
  def dijkstra(start_node)
    intree = {}
    parent = {}
    distance = set_distance_hash

    distance[start_node] = 0
    current_node = start_node

    until(intree[current_node])
      intree[current_node] = true;
      puts current_node

      adjacent_nodes = @edges[current_node]
      adjacent_nodes.each do |adjacent_node|
        weight = adjacent_node.weight
        if distance[adjacent_node] > (distance[current_node] + weight)
          distance[adjacent_node] = distance[current_node] + weight
          parent[adjacent_node] = current_node
        end
      end

      dist = MAX_INT
      @edges.each do |node, adjacent_nodes|
        if !intree[node] && distance[node] < dist
          puts "dist #{node} from root: #{distance[node]}"
          dist = distance[node]
          current_node = node
        end
      end
    end
  end

  def breadth_first_search(start_node)
    @discovered = {}
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
    @discovered = {}
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
    @discovered = {}
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
end

graph_info = [[1, 2], [1, 3], [1, 4], [3, 4], [4, 5], [2,7], [5,6], [8,9]]
graph = Graph.new(graph_info, false)
# graph.depth_first_search(1)
# puts ""
# graph.recursive_dfs(1)
# puts ""
# graph.breadth_first_search(1)
# puts ""
# graph.breadth_first_search(8)
graph.dijkstra(1)
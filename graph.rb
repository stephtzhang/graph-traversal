MAX_INT = ComputerInfo.max_int

class Graph
  attr_reader :edges, :directed

  def initialize(directed)
    @edges = {}
    @directed = directed
    @discovered = {}
  end

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
        if distance[adjacent_node.connected_node] > (distance[current_node] + weight)
          distance[adjacent_node.connected_node] = distance[current_node] + weight
          parent[adjacent_node.connected_node] = current_node
        end
      end

      dist = MAX_INT
      @edges.each do |node, adjacent_nodes|
        # add node to tree that has the lowest distance from root
        # of all discovered nodes that have not already been added to tree
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
        adjacent_node = adjacent_node.connected_node
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
        adjacent_node = adjacent_node.connected_node
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
    search_children(start_node)
  end

  def search_children(node)
    puts node
    # process node here (early)

    @discovered[node] = true
    adjacent_nodes = @edges[node]
    adjacent_nodes.each do |adjacent_node|
      adjacent_node = adjacent_node.connected_node
      unless @discovered[adjacent_node]
        @discovered[adjacent_node] = true
        search_children(adjacent_node)
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
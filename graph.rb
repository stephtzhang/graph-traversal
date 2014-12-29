class Graph
  attr_reader :edges

  def initialize(graph_info, directed)
    @edges = {}
    @directed = directed
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
end

class EdgeNode
  def initialize()
  end
end

graph_info = [[1, 2], [1, 3], [1, 4], [3, 4], [4, 5], [2,7], [5,6]]
graph = Graph.new(graph_info, false)
puts graph.edges

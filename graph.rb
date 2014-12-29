class Graph
  def new(graph_info)
    @edges = {}
    make_edges(graph_info)
  end

  def make_edges(graph_info)
    graph_info.foreach do |node|
      if @edges[node]

      else

      end
  end
end

class EdgeNode
  def new()
  end
end

graph_info = [[1, 2], [1, 3], [1, 4], [3, 4], [4, 5], [2,7], [5,6]];
graph = Graph.new(graph_info)

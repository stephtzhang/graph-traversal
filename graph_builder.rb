module GraphBuilder
  def self.build_graph(graph_arr, directed)
    graph = Graph.new(directed)
    graph_arr.each do |connection|
      make_edges(connection[0], connection[1], connection[2], graph.directed, graph)
    end

    return graph
  end

  def self.make_edges(origin, destination, weight, pair_processed, graph)
    if graph.edges[origin]
      graph.edges[origin] << EdgeNode.new(destination, weight)
    else
      graph.edges[origin] = [EdgeNode.new(destination, weight)]
    end

    make_edges(destination, origin, weight, true, graph) unless pair_processed
  end
end
require_relative 'computer_info.rb'
require_relative 'edge_node.rb'
require_relative 'graph.rb'

graph_info = [[1, 2, 1], [1, 3, 1], [1, 4, 4], [3, 4, 1], [4, 5, 1], [2, 7, 1], [5, 6, 3], [8, 9, 1], [7, 6, 5]]
graph = Graph.new(graph_info, false)
graph.depth_first_search(1)
puts ""
graph.recursive_dfs(1)
puts ""
graph.breadth_first_search(1)
puts ""
graph.dijkstra(1)
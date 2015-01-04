class EdgeNode
  attr_reader :connected_node, :weight

  def initialize(connected_node, weight = 0)
    @connected_node = connected_node
    @weight = weight
  end
end
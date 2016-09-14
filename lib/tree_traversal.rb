# This is a tree
# It has a payload and - potentially - children
class Tree
  attr_accessor :payload, :children

  def initialize(payload, children = nil)
    @payload = payload
    @children = children
  end
end

# This is a first in first out queue
# It functions much like a stack
class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end
end

# This is the depth first method
#
# It uses recursion to dive deep as possible. When there are no more
# children, it checks if the payload matches the target before backing
# downwards. It eventually gives up when the first_node has no more children
# and doesn't match the payload.

def depth_first(node, target)
  if node.children
    node.children.each do |child|
      depth_first(child, target)
    end
  end
  return 'Found your target' if node.payload == target
  'No luck'
end

# This is the breadth first method
#
# As it works its way through the tree, it adds what it finds to a queue.
# Because items are dequeued based on the order they come in a first-in,
# first-out (FIFO) fashion, the leaves are evaulated at the end the trunk
# at the beginning after its branches.

def breadth_first(node, target)
  # Setup
  queue = Queue.new
  queue.enqueue(node)
  # While queue exists
  while queue
    # Pop bottom off
    current_node = queue.dequeue
    # Check if it is target or nil
    return 'Could not locate your payload :(' if current_node.nil?
    return 'Found your target' if current_node.payload == target
    # Otherwise add its children to
    # back of line for checking
    add_kids_to_queue(current_node, queue)
  end
end

def add_kids_to_queue(node, queue)
  if node.children
    node.children.each do |child|
      queue.enqueue(child)
    end
  end
end

# -- Tree Setup

# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])

# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

# Runs both methods displaying output to console
puts depth_first(trunk, 2)
puts breadth_first(trunk, 4)

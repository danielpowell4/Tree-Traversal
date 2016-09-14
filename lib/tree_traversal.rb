# This is a tree it has a payload and a children
class Tree
  attr_accessor :payload, :children

  def initialize(payload, children = nil)
    @payload = payload
    @children = children
  end
end

# This is a first in first out queue much like a stack
class Queue
  def initialize
    @queue = []
  end

  def enqueue(item)
    @queue.push(item)
  end

  def dequeue
    @queue.shift
  end

  def breadth_first(node, target)
    puts node.payload
    return 'unable to locate payload' if node.nil?

    node.children.each do |child|
      enqueue(child) unless child.nil?
      return 'Payload has been found!' if child.payload == target
    end

    current_node = dequeue
    breadth_first(current_node, target)
  end

  def depth_first(node, target)
    return 'unable to locate payload' if node.nil?
    node.children.each do |child|
      unless child.nil?
        breadth_first(child, target)
        return 'Payload has been found!' if child.payload == target
      end
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

queue = Queue.new
puts queue.breadth_first(trunk, 11)
puts queue.depth_first(trunk, 2)

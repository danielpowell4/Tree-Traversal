# Tree-Traversal
### Depth and breadth first searching in a tree of nodes in Ruby

#Background
Traversing a node of trees is a key function of most every program.
It's a piece of how you can use something like `command+F` to find 
what you're looking for on your screen and how google knows where to
go next as it indexes the web. 

There are two main thought patterns to accomplish this: depth-first and breadth-first.
Using a depth-first mentality and tree metaphor the method runs from the trunk to its first branch and then to that branch's first leaf. As this metaphor ends at a leaf, the function then checks if that branch has any other leaves. If it does, checks them. When no more leaves are on the branch it the checks the branch. It then returns back to the trunk and goes to the other branches. Then to the next branch's leaves. This occurs until there are no more leaves or branches to check. The function then checks if the trunk node's payload matches a given target.

Using a breadth-first mentality and our same tree metaphor, the function first checks the trunk. Then if the trunk doesn't match, it then examines if there are any branches. As it looks it adds the branches to a queue for later processing. When there are no more branches to add it then checks the first branch and adds its children leaves to the queue. It then takes the next branch from the tree, does a check to see if there is a match and then adds its children to the queue. This continues until there are no more branches. It then checks the leaves' values and the presence of more distant nodes before, perhaps, returning a `Target not found :(` message. Though it did look, it promises to.

#How to run locally
1. Clone onto your machine
2. `cd` into it 
3. From commandline run `ruby /lib/tree_traversal.rb`

#Files worth a look
Just one here, really: [/lib/tree_traversal.rb](https://github.com/danielpowell4/Tree-Traversal/blob/master/lib/tree_traversal.rb)

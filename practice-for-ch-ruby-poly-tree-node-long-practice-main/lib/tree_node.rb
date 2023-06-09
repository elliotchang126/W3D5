
class PolyTreeNode

    attr_reader :value, :parent, :children  
    
    def initialize(value)
        @value = value
        @parent = nil 
        @children = []
    end

    def parent=(new_parent)
         # if self currently has a parent
                # remove self from parent childen
            if self.parent       # truthy /falsey check because parent could be nil, new_p could be nil
                self.parent.children.delete(self)
            end
            # reassign parent to new_parent
                    @parent = new_parent    #self.prent = is calling the method itself 
            # add self to new_parent.children(only if !new_parent.nil?)
                    new_parent.children << self unless self.parent.nil?  # or !if self.parent 
    end

    def add_child(node3)
        if !self.children.include?(node3) 
        node3.parent = self
        # self.children << node3   
        end
    end

    def remove_child(node)
        raise "not a child" if node.parent.nil? 
        node.parent = nil
    end

    def dfs(target_value)
        # return nil if self.children.length == 0 
        return self if self.value == target_value

        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil? 
        end
        nil

    end

    def bfs(target_value)
        que = [self]

        until que.empty? 
            ele = que.shift 
            return ele if ele.value == target_value 
            ele.children.each do |child|
                que << child
            end 
        end
        nil
    end


end


# n1 = PolyTreeNode.new("parent1")
# c1 = PolyTreeNode.new("child1")
# c2 = PolyTreeNode.new("child2")

# c1.parent = n1
# c2.parent = n1

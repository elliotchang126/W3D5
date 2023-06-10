require_relative "../practice-for-ch-ruby-poly-tree-node-long-practice-main/lib/tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos) 
        x,y = pos 
        
        valid_positions = [[x+2, y+1], [x+2, y-1], [x-2, y+1], [x-2, y-1], 
                           [x+1, y+2], [x+1, y-2], [x-1, y+2], [x-1, y-2] ]
        
            #should check with board strains
            valid_positions.select do |pos|
                pos.all? {|ele| ele >= 0 && ele < 8}
            end

        # @considered_positions += valid_positions
    end

    

    attr_reader :position, :considered_positions

    def initialize(pos)
        @position = pos     #starting position 
        @considered_positions = [pos] 

        # @board = Array.new(8){Array.new(8,"_")} 
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos).reject {|valid_p| @considered_positions.include?(valid_p)}
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
        root_node = PolyTreeNode.new(@position)

        que = [root_node]
        
        until que.empty?
            ele = que.shift

            possible_moves = new_move_positions(ele.value)
            new_nodes = possible_moves.map {|pos| PolyTreeNode.new(pos)}
            new_nodes.each {|node| ele.add_child(node)}

            ele.children.each do |child|
                que << child 
            end
        end
        que
    end




end

#   @kpf = KnightPathFinder.new(pos)
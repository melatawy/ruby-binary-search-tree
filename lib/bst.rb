require_relative 'bst/node'
class BST
	
	attr_accessor :head
	attr_accessor :comparator
	
	def initialize(comparator)
		self.comparator = comparator
		self.head = nil
	end
	
	def push(new_object,is_right=1,parent=nil)
		new_node = Node.new(new_object)
		if parent.nil?
			runner = self.head
		elsif is_right == 1
			runner = parent.right_node
		else
			runner = parent.left_node
		end
		if runner.nil? && parent.nil?
			self.head = new_node
		elsif runner.nil? && !parent.nil?
			parent.right_node = new_node if is_right == 1
			parent.left_node = new_node if is_right == -1
		else
			result = self.comparator.call runner.content, new_node.content
			self.push(new_object,result,runner)
		end
	end
	
	def prefix(runner = nil, parent = nil, content_array = [])
		runner = self.head if runner.nil? && parent.nil?
		if runner.nil? && parent.nil?
			return content_array
		elsif runner.nil? && !parent.nil?
			content_array += []
		else
			content_array += [runner.content]
			content_array = prefix(runner.left_node, runner, content_array)
			content_array = prefix(runner.right_node, runner, content_array)
		end
		content_array
	end
	
	def infix(runner = nil, parent = nil, content_array = [])
		runner = self.head if runner.nil? && parent.nil?
		if runner.nil? && parent.nil?
			return content_array
		elsif runner.nil? && !parent.nil?
			content_array += []
		else
			content_array = infix(runner.left_node, runner, content_array)
			content_array += [runner.content]
			content_array = infix(runner.right_node, runner, content_array)
		end
		content_array
	end
	
	def postfix(runner = nil, parent = nil, content_array = [])
		runner = self.head if runner.nil? && parent.nil?
		if runner.nil? && parent.nil?
			return content_array
		elsif runner.nil? && !parent.nil?
			content_array += []
		else
			content_array = postfix(runner.left_node, runner, content_array)
			content_array = postfix(runner.right_node, runner, content_array)
			content_array += [runner.content]
		end
		content_array
	end
	
	def remove_head
		
	end
end
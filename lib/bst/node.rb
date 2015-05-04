class Node
	attr_accessor :left_node
	attr_accessor :right_node
	attr_accessor :content
	
	def initialize(content)
		if content.class == Node
			self.content = content.content
		else
			self.content = content
		end
		self.left_node = nil
		self.right_node = nil
	end
	
end
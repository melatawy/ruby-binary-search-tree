gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/bst'

class BstTest < MiniTest::Unit::TestCase
	
	def setup
		@bst_inst = BST.new( lambda {|x,y| return ((x < y)? 1 : -1) } )
		
		assert_silent { @bst_inst.push 5 }
		assert_silent { @bst_inst.push 1 }
		assert_silent { @bst_inst.push 3 }
		assert_silent { @bst_inst.push 7 }
	end
	
	def test_comparator
		assert_equal 1, @bst_inst.comparator.call(5,6)
		assert_equal(-1, @bst_inst.comparator.call(15,6))
	end

	def test_prefix
		assert_equal [5,1,3,7], @bst_inst.prefix
	end
	
	def test_infix
		assert_equal [1,3,5,7], @bst_inst.infix
	end
	
	def test_postfix
		assert_equal [3,1,7,5], @bst_inst.postfix
	end
	
	def test_remove_head
		assert_equal 5, @bst_inst.remove_head
		assert_equal 3, @bst.head.content
	end
end
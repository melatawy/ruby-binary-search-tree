# ruby-binary-search-tree
This is a simple implemenation for binary search tree in ruby

# Usage
First install the gem 
```
gem install bst
```

first require bst, then initialize a new instance of BST with a lambda function which will be used in comparing results.
This function should return 1 if first value is greater (should be placed on left), and -1 otherwise.

```ruby
require 'bst'
bst_instance = BST.new( lambda {|x,y| return ((x < y)? 1 : -1) } )
```

In order to add a new value
```ruby
bst_instance.push 5
bst_instance.push 1
bst_instance.push 3
bst_instance.push 7
```

In order to return an array of traversal, just call the method of traversal you need
```ruby
bst_instance.prefix
bst_instance.infix
bst_instance.postfix
```

This should return respectively:
```
[5,1,3,7]
[1,3,5,7]
[3,1,7,5]
```

Feel free to fork and contribute...
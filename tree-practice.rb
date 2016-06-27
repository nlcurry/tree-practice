class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
     @count = 0
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

# part 1
def operators(node)
  return if node == nil
  operators(node.left)
  if node.left != nil || node.right != nil
    print node.value + " "
  end
  operators(node.right)
end

# part 2
def countnonops(node, count = 0)
  if node.left == nil && node.right == nil
    return 1
  else
    countnonops(node.left, count += 1) + countnonops(node.right, count += 1)
  end
end

# part 3
def prefix(node)
  return if node == nil
  print node.value + " "
  prefix(node.left)
  prefix(node.right)
end

def postfix(node)
  return if node == nil
  postfix(node.left)
  postfix(node.right)
  print node.value + " "
end

# part 4
def find_op(node, operator)
  if node.value == operator && node.value.match(/\D/) != nil
    return true
  elsif node.left != nil || node.right != nil
    find_op(node.left, operator)
    find_op(node.right, operator)
  else
    return false
  end
end

root = TreeNode.new("-")
root.right = TreeNode.new("%")
root.right.left = TreeNode.new("10")
root.right.right = TreeNode.new("5")
root.left = TreeNode.new("+")
root.left.right = TreeNode.new("2")
root.left.left = TreeNode.new("*")
root.left.left.left = TreeNode.new("4")
root.left.left.right = TreeNode.new("3")
puts print_infix(root)
puts operators(root)
puts countnonops(root)
puts prefix(root)
puts postfix(root)
puts "find_op should return false"
puts find_op(root, ")")
puts "find_op should return true"
puts find_op(root, "-")
puts "find_op should ignore digit input and return false"
puts find_op(root, "9")
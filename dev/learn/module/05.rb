module Bar
  def my_method
    'in module'
    super # go up to the tree, back to Foo
  end
end

class Foo
  prepend Bar

  def my_method
    'in class'
  end
end

x = Foo.new
p x.my_method
# so: but prepend overwrites
puts Foo.ancestors
module Bar
  def my_method
    'in module'
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
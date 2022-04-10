module Bar
  def my_method
    'in module'
  end
end

class Foo
  include Bar

  def my_method
    'in class'
  end
end

x = Foo.new
p x.my_method
# so: include does not overwrite methods in class
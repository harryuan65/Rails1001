module Bar
  def my_method
    'in module'
  end
end

class Foo
  include Bar

  def my_method
    'in class'
    super  # bar is in the higher position
  end
end

x = Foo.new
p x.my_method
# so: but prepend overwrites
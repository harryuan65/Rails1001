module Bar
  def my_method
    10
  end
end

class Foo
  include Bar
end

x = Foo.new
p x.my_method
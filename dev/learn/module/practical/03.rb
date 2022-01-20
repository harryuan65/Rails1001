class Foo
  def my_method
    'inside class'
  end
end


module Bar
  def my_method
    'in module'
  end

  prepend_features Foo # works the same, but from module
end

x = Foo.new
puts x.my_method
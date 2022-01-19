# dynamically defined the behaviour
def multiple_generator(m)
  lambda do |n|
    n * m
  end
end

doubler = multiple_generator(2)
tripler = multiple_generator(3)

puts doubler[5] # 10
puts tripler[10] # 30
# other languages implement with data structure that store the variable reference and their value when closure is created.
# but ruby only a reference is kept, so the context can be changed before the proc has chance to run.
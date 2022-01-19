# Enforces arity
# i.e. enforces argument count
hello = lambda do
  puts "This hello lambda"
end

hello.call

#  wrong number of arguments (given 0, expected 3) (ArgumentError)
# lambda_with_args = lambda do |a, b, c|
#   puts "This hello lambda with #{a} #{b} #{c}"
# end

# lambda_with_args.call


#  works but rest is nil
proc_with_args = proc do |a, b, c|
  puts "This hello proc with #{a} #{b} #{c}"
end

proc_with_args.call(2)
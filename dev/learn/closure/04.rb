# changing context

def run_proc(p)
  p.call
end


name = 'Fred'

print_a_name = proc {puts name}

name = 'John'

run_proc print_a_name
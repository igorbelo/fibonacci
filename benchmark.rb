require 'benchmark'

def fib_recursive(n)
  return 1 if n == 1 || n == 2
  return fib_recursive(n-1) + fib_recursive(n-2)
end

def fib_dynamic(n)
  memory = [0,1,1]
  return memory[n] if n <= 2

  (3..n).each do |i|
    memory[i] = memory[i-1] + memory[i-2]
  end

  memory[n]
end

puts "Recursive: #{ Benchmark.measure { fib_recursive(40) } }"
puts "Dynamic:   #{ Benchmark.measure { fib_dynamic(40) } }"

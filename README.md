This repository shows the different approaches to calculate the N-th term of the Fibonacci sequence and some considerations about each one.

## 1. Recursive

The recursive approach is the worst as it re-computes two times the same n, for example:

```ruby
fib(5) = fib(4) + fib(3)
fib(4) = fib(3) + fib(2)
fib(3) = fib(2) + fib(1)
```

### Recursive implementation
```ruby
def fib(n)
  return 1 if n == 1 || n == 2
  return fib(n-1) + fib(n+2)
end
```

## 2. Dynamic Programming

An alternative to recursive approach is the dynamic programming.

This technique consists to store the result in memory, and the cost of re-calculation in recursive approach is changed by the cost of accessing the memorized result (cheaper).

### Dynamic Programming implementation:
```ruby
def fib(n)
  memory = [0,1,1]
  return memory[n] if n <= 2
  (2..n).each do |i|
    memory[i] = memory[i-1] + memory[i-2]
  end
  
  memory[n]
end
```

## Benchmarks
For the 40th term the results were:
```
              user        sys       total      real
Recursive:  16.980000   0.050000  17.030000 ( 17.194730)
Dynamic:     0.000000   0.000000   0.000000 (  0.000016)
```

The recursive approach took 17s to find the 40th term, as the dynamic approach took 0.000016s.

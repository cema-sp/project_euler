#!/usr/bin/ruby

primes = Enumerator.new do |y|
  prs = []
  curr = 2
  loop do
    if prs.none? { |p| curr % p == 0 }
      prs << curr
      y.yield curr
    end
    curr = curr.succ
  end
end

# n = 13195
n = 600851475143

dividers = []
loop do
  prime = primes.next

  break if n == 1
  next unless n % prime == 0

  n = n / prime
  dividers << prime
end

puts dividers.last


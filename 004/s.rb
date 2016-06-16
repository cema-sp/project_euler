#!/usr/bin/ruby

num = (ARGV[0] || '2').to_i

def makePairs(n)
  max = ('9' * n).to_i

  Enumerator.new do |yielder|
    xs = (1..max).reverse_each
    
    (0..(max - 1)).each do |d|
      ys = (1..(max - d)).reverse_each

      xs.zip(ys).each do |pair|
        yielder.yield pair if pair[0] && pair[1]
      end
    end
  end
end

def isPalindrome(s)
  (0..s.size/2).each do |i|
    return false if s[i] != s[s.size - 1 - i]
  end

  true
end

def findPalindrome(n)
  pairs = makePairs(n)
  pairs
    .zip(pairs.map { |x, y| x * y })
    .select { |pair, prod| isPalindrome(prod.to_s) }
    .max_by(&:last)
end

puts "N = #{num}"
puts "Solution: #{findPalindrome(num)}"


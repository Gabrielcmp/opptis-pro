#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'timeConversion' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def timeConversion(s)
    # Write your code here
    b = s[-2..-1] == 'PM' ? 12 : 0
    p b
    h = s.split(':')[0]
    h = h.to_i%12 + b
    p h
    p h.to_s + s[2..-3]
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.chomp

result = timeConversion s

fptr.write result
fptr.write "\n"

fptr.close()
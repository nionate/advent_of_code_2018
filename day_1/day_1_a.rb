def sum(acc, num) 
    acc + num
end

num = 0
File.open('input.txt').each{ |line|
    num = sum(num, line.to_i)
}

puts num


def sum(acc, num) 
    acc + num
end

frequencies = [0]
num = 0
File.open('input.txt').each { |line| 
    num = sum(num, line.to_i)
    twice = frequencies.index(num)
    if(twice.nil?) then
        frequencies.push(num)
    else
        puts "num #{num}"
        puts "frequencies #{frequencies}"
        break
    end
}

puts num
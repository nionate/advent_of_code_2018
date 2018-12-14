file = File.open('input.txt')
regex = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/m

arr = Array.new(1000){Array.new(1000, 0)}
ids = Array.new(1000){Array.new(1000, 0)}

file.each do |line|
    id,left_inches,top_inches,wide_inches,tall_inches = line.match(regex).captures  
    (top_inches.to_i..top_inches.to_i + tall_inches.to_i - 1).each do |i|
        (left_inches.to_i..left_inches.to_i + wide_inches.to_i - 1).each do |j|
            arr[i][j] += 1
            ids[i][j] = id
        end
    end
end

index_claim = arr.flatten.index { |inches|
    inches == 1
}

puts arr.flatten[index_claim]

puts ids.flatten
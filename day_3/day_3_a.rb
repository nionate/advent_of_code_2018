file = File.open('input.txt')
re = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/m

arr = Array.new(1000){Array.new(1000, 0)}

def print_fabric(array)
    file = "output.txt"
    array.each_with_index { |v,i|
        array[i].each_with_index { |d,j|
            File.write(file, array[i][j], mode:'a')
        } 
    }
end

puts "prueba #{arr[977][19]}"

inches = 0
file.each do |line|
    id,left_inches,top_inches,wide_inches,tall_inches = line.match(re).captures
    (top_inches.to_i..top_inches.to_i + tall_inches.to_i - 1).each do |i|
        (left_inches.to_i..left_inches.to_i + wide_inches.to_i - 1).each do |j|
            if arr[i][j].to_i != 0 then
                inches += 1
            else
                arr[i][j] = id
            end
        end
    end
end

puts inches
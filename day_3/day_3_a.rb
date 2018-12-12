file = File.open('input.txt')
re = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/m

arr = Array.new(1000){Array.new(1000)}

def create_fabric(array)
    array.each_with_index { |v,i|
        array[i].each_with_index { |d,j|
            array[i][j] = 0
        }   
    }
end

def print_fabric(array)
    array.each_with_index { |v,i|
        array[i].each_with_index { |d,j|
            print array[i][j]
        } 
        print  "\n"
    }
end

create_fabric arr

inches = 0
file.each do |line|
    id,left_inches,top_inches,wide_inches,tall_inches = line.match(re).captures
    puts id
    for i in 0..tall_inches.to_i
        for j in 0..wide_inches.to_i 
            if arr[top_inches.to_i+i][left_inches.to_i+j] != 0 then
                inches += 1
            else
                arr[top_inches.to_i+i][left_inches.to_i+j] = id
            end
        end
    end
end

puts inches
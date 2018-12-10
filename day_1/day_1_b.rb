def repeated_frequency
    frequencies = {}
    current_frequency = 0
    file = File.open('input.txt')

    file.each do |line| 
        current_frequency += line.to_i
        if frequencies[current_frequency].nil?
            frequencies[current_frequency] = 1
        else
            return current_frequency
        end
    
        if file.eof?
            file.rewind
        end
    end
end

puts repeated_frequency
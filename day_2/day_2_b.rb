file = File.open("input1.txt")

def compare(line1, line2) 
    result = ""
    line1.chars.each_with_index{  |value, index|
        result += value if line2[index] == value
    }

    return result if result.length == line1.length-1 
end

lines = file.to_a

lines.each { |line|
    lines.each { |line2|
        result = compare(line, line2)
        if result 
            print result 
            exit   
        end
    }
}
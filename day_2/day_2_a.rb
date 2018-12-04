file = File.open('input.txt')
count_hash = {"2" => 0, "3" => 0}
checksum_hash = {"2" => 0, "3" => 0}

def get_result(checksum_hash)
    checksum_hash["2"] * checksum_hash["3"]
end

def update_checksum(count_hash, checksum_hash)
    if (count_hash["2"] > 0)
       checksum_hash["2"] += 1
    end
    if (count_hash["3"] > 0)
      checksum_hash["3"] += 1
    end
end

file.each{ |line|
    array = line.chars
    array.each{ |char|
        num = array.count(char)
        if (num == 2)
            count_hash["2"] += 1
            array.delete(char)
        end
        if (num == 3)
            count_hash["3"] += 1
            array.delete(char)
        end
    }
    update_checksum(count_hash, checksum_hash)
    count_hash["2"] = 0
    count_hash["3"] = 0
}

puts get_result(checksum_hash)

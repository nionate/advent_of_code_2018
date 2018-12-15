file = File.open('input.txt')
$regex = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/m

arr = Array.new(1000){Array.new(1000, [])}

def claims(file)
    claims = []
    file.each do |line|
        id,left_inches,top_inches,wide_inches,tall_inches = line.match($regex).captures  
        claims << id
    end
    return claims
end

valid_claims = claims(file)

file.rewind

file.each do |line|
    id,left_inches,top_inches,wide_inches,tall_inches = line.match($regex).captures  
    (top_inches.to_i..top_inches.to_i + tall_inches.to_i - 1).each do |i|
        (left_inches.to_i..left_inches.to_i + wide_inches.to_i - 1).each do |j|
            
            if(!arr[i][j].include? id)
                arr[i][j] << id
            end

            if arr[i][j].length > 1 then
                arr[i][j].each do |val|
                    index = valid_claims.index(val)
                    valid_claims.delete_at(index) if !index.nil?
                end
            end
        end
    end
end

#index_claim = arr.flatten.index { |inches|
#    inches == 1
#}

#for i in 0..arr.length-1
#    for j in 0..arr[i].length-1
#        puts arr[i][j] if arr[i][j].length == 1
#    end
#end

puts valid_claims

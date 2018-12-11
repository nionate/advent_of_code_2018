file = File.open('input.txt')
re = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/m

arr = []


file.each do |line|
    id,left_inches,top_inches,wide_inches,tall_inches = line.match(re).captures
    
end
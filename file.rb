file = File.open("sample.txt") {|f| f.read.split}
file.map! do |word|
    word.gsub(/[\.\! ]/, "")
    word.downcase
end

p file

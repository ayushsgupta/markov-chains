module MarkovChain
    def self.generate(filename, len)
        file = File.open(filename) {|f| f.read.split}
        file.map! do |word|
            word.gsub!(/\W|\d/, "")
            word.downcase
        end
        file << ""
        
        current_word = file[0]
        for i in (1..len)
            @list = get_list
            @list.sort_by {|key, value| value}.reverse.to_h
        end
    end

    private

    def self.get_list
        succeeding_words = {}
        index = 0
        while index < file.length - 1
            if file[index] == current_word && file[index + 1] != ""
                if succeeding_words.has_key?(file[index + 1])
                    succeeding_words[file[index + 1]] = succeeding_words.fetch(file[index + 1]) + 1
                else
                    succeeding_words[file[index + 1]] = 1
                end
            end
            index += 1
        end
        return succeeding_words
    end

    def self.select_word 
        sum = list.values.inject(0, &:+)
        r = Random.new 
        rand_num = r.rand(0..sum)
        idx = 0 
        while idx < list.values.length 
            if rand_num <= list.values[0..idx].inject(0, &:+)
            end 
        end
    end 
end

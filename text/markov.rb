module MarkovChain
    def self.generate(filename, len)
        file = File.open(filename) {|f| f.read.split}
        file.map! do |word|
            word.gsub!(/\d/, "")
            word = word.split("").keep_if {|a| a =~ /\w|-/}.join
        end
        file << ""

        current_word = file[0]
        final_string = ""

        for i in (1..len)
            final_string << current_word + " "
            succeeding_words = get_list(file, current_word, old_word)
            new_current = ""
            until new_current != ""
                new_current = select_word(succeeding_words)
            end
            old_word = current_word
            current_word = new_current
        end

        return final_string
    end

    private

    def self.get_list(file, current_word, old_word)
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
        
        succeeding_words = get_list(file, old_word, file[0]) if succeeding_words.empty?

        succeeding_words = succeeding_words.sort_by {|key, value| value}.reverse
        return succeeding_words
    end

    def self.select_word(succeeding_words)
        frequency_list = []
        succeeding_words.each {|random_array| frequency_list << random_array[1]}

        sum = frequency_list.inject(0, &:+)
        r = Random.new
        rand_num = r.rand(0..sum)
        index = 0
        final_pos = 0
        flag_1 = false

        until flag_1 == true
            if rand_num <= frequency_list[0..index].inject(0, &:+)
                final_pos = index
                flag_1 = true
            end
            index += 1
        end

        return succeeding_words[final_pos][0]
    end
end

class MarkovChainGenerator
    def initialize(filename)
        @file = File.open(filename) {|f| f.read.split}
        @file.map! do |word|
            word.gsub(/[\.\! ]/, "")
            word.downcase
        end
        @file << ""
    end

    def generate(len)
        @current_word = @file[0]
        for i in (1..len)
            @list = get_list
            @list.sort_by {|key, value| value}.reverse.to_h
        end
    end

    private

    def get_list
        @succeeding_words = {}
        index = 0
        while index < @file.length
            if @file[index] == @current_word
                if @succeeding_words.has_key?(@file[index])
                    @succeeding_words[@file[index]] = @succeeding_words.fetch(@file[index]) + 1
                else
                    @succeeding_words[@file[index]] = 1
                end
            end
        end
        return @succeeding_words
    end

    def select_word 
        @sum = @list.values.inject(0, &:+)
        r = Random.new 
        @rand_num = r.rand(0..@sum)
        idx = 0 
        while idx < @list.values.length 
            if @rand_num <= @list.values[0..idx].inject(0, &:+)
            end 
        end
    end 
end

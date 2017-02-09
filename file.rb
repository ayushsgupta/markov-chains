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
        return @succeeding_words
    end
end

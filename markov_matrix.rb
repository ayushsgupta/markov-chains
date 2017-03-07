class Matrix1
    attr_reader :array, :rows, :columns

    def initialize(ary)
        @rows = ary.length
        @columns = ary[0].length
        @array = ary
    end

    def multiply(s)
        b = s.array
        rowSecond = b.length
        columnSecond = b[0].length
        if @columns == rowSecond
            ret = Array.new(@rows) {Array.new(columnSecond)}
            ret.map! {|ary| ary.map! {|e| e = 0} }
    	    for i in (0...@rows)
    	        for j in (0...columnSecond)
    			    for k in (0...@columns)
    				    ret[i][j] += @array[i][k] * b[k][j]
    	            end
    		    end
    	    end
            return self.class.new(ret)
        end
    end

    def to_s
        str = ""
        @array.each do |ary|
            ary.each {|e| str << e.to_s + "\t"}
            str << "\n"
        end
        return str
    end

    def print_matrix
        print to_s
    end

    def round(d = 4)
        a = array
        i1 = 0
        while i1 < a.length
            i2 = 0
            while i2 < a[i1].length
                a[i1][i2] = a[i1][i2].round(d)
                i2 += 1
            end
            i1 +=1
        end
        @array = a
    end
end

class TransitionMatrix < Matrix1
    def initialize(ary)
        super
        if @rows != @columns
            if @rows > @columns
                @array = @array[0..(@columns-1)]
            end
        end
    end

    def equilibrium(p_vector)
        z = transition_power(5000)
        a = p_vector.multiply(z)
        a.round
        return a
    end

    private

    def transition_power(n)
        if n == 1
            return self
        else
            return self.multiply(transition_power(n - 1))
        end
    end
end

class ProbabilityVector < Matrix1
    def initialize(ary)
        super
        if @rows > 1
            @array = @array[0]
        end
    end
end

class MarkovChain
    def initialize(trans, prob)
        @transition_matrix = trans
        @probability_vector = prob
        @original_t = trans
        @original_p = prob
    end

    def trial(n = 1)
        if n > 0
            @probability_vector = @probability_vector.multiply(transition_power(n))
            round
        end
    end

    def state_at(which)
        return (1..(@probability_vector.columns)).include?(which) ? probability_vector[which - 1] : nil
    end

    def restore
        @transition_matrix = @original_t
        @probability_vector = @original_p
    end

    def t_object
        return @transition_matrix
    end

    def p_object
        return @probability_vector
    end

    def e_object
        return @transition_matrix.equilibrium(@probability_vector)
    end

    def transition_matrix
        return t_object.array
    end

    def probability_vector
        return p_object.array.flatten
    end

    def equilibrium
        return e_object.array.flatten
    end

    private

    def transition_power(n)
        if n == 1
            return @transition_matrix
        else
            return @transition_matrix.multiply(transition_power(n - 1))
        end
    end

    def round
        @probability_vector.round
    end
end
=begin
t = TransitionMatrix.new([[0.6, 0.4], [0.7, 0.3]])
v = ProbabilityVector.new([[0.56, 0.44]])
myMarkov = MarkovChain.new(t, v)
p myMarkov.probability_vector
for i in (1..5)
    puts i
    myMarkov.trial
    p myMarkov.probability_vector
end
puts "Equilibrium: "
myMarkov.restore
p myMarkov.equilibrium
#p myMarkov.probability_vector
#p myMarkov.equilibrium
=end

t = TransitionMatrix.new([[0.9, 0.1], [0.5, 0.5]])
v = ProbabilityVector.new([[0.9, 0.1]])
weather = MarkovChain.new(t, v)

weather.trial
p weather.transition_matrix

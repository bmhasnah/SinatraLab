class RegexTester

    def initialize(pattern=nil)
         @pattern = pattern unless pattern.nil? 
    end
    
    attr_accessor :pattern 
    
    def statements=(arr)
        begin
            raise TypeError unless arr.class == Array 
            raise RuntimeError if arr.empty? @statements = arr
            rescue RuntimeError
            STDERR.puts "You need to have at least one statement to test against the pattern." 
            add_insult
            exit
            rescue TypeError
            STDERR.puts "You must enter an ARRAY of statements to use this regex_tester."
            add_insult
            exit
        end 
    end
    
    def add_insult
        STDERR.puts "INSULT" 
        STDERR.puts "As a coding infidel, you are hereby sentenced to death. The firing squad will be here shortly to carry out the execution. Please remain seated until they arrive. Thank you for your cooperation."
    end

    def statements
        @statements
    end 
    
    def test
        if pattern_matches? @statements
        puts "MATCH: #{@statements}" else
        STDERR.puts "NO MATCH: #{@statements}" end
    end
    
    #private
    def  pattern_matches? statements
     statements.match(@pattern) != nil
     end 
    
end

regex = RegexTester.new
regex.pattern = /^(http:\/\/)?www\.\w+\.(com|edu|org)$/ # from test_arrays.rb puts regex.pattern
regex.statements = "http://www.google.com"
puts regex.statements
puts "------"
regex.test
regex.statements = "apidock.com"
regex.test




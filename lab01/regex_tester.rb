class RegexTester

    def initialize(pattern=nil)
         @pattern = pattern unless pattern.nil? 
    end
    
    attr_accessor :pattern 
    
    def statements=(arr)
       begin
        raise TypeError unless arr.class == Array 
        raise RuntimeError if arr.empty?
        @statements = arr
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
       # STDERR.puts "As a coding infidel, you are hereby sentenced to death. The firing squad will be here shortly to carry out the execution. Please remain seated until they arrive. Thank you for your cooperation."
    end

    def statements
        @statements
    end 
    
    def test
        @statements.each do |r|
            if pattern_matches? r
             puts "MATCH: #{r}" else
            STDERR.puts "NO MATCH: #{r}" end
        end
    end
    
    private
    def  pattern_matches? statements
     statements.match(@pattern) != nil
    end 
    
end

regex = RegexTester.new
#cc.statements= %w[1234567890123456 1234-5678-9012-3456 1234\ 5678\ 9012\ 3456
#1234567890 #1234567890123456 1234|5678|9012|3456]
#cc.pattern= /^\d{16}$/
#cc.pattern = /^\d{16}$|^(\d{4}-\d{4}-\d{4}-\d{4})$/
#cc.pattern = /^\d{16}$|^((\d{4}-){4})$/
#cc.pattern = /^\d{16}$|^((\d{4}-?){4})$/
#cc.pattern = /^\d{16}$|^(\d{4}[ -]?){4}$/
#cc.pattern = /^(\d{4}[ -]?){4}$/
#cc.test
#=begin
puts "------1"
regex.pattern = /^\S\.?\S+\.(com|edu|org|net|co|uk)$/ # from test_arrays.rb puts regex.pattern
puts "------2"
regex.statements = ['http://www.google.com', 'apidock.com', 'www.microsoft.com', 'http://www.heimann-family.org', 'http://www.kli.org', 'http://www.acac.net', 'http://www.cmu.edu', 'http://is.hss.cmu.edu', 'www.amazon.co.uk']
puts "------3"
puts regex.statements
puts "------4"
regex.test
regex.statements = "apidock.com"
regex.test
#=end


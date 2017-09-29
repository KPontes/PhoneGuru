require 'string_analyzer' 

describe StringAnalyzer do 
   context "With valid input" do 
      
      it "should detect when a string contains only numbers" do 
         sa = StringAnalyzer.new 
         test_string = '1115' 
         expect(sa.has_numbers? test_string).to be true
      end 
		
      it "should detect when a string doesn't contain numbers" do 
         sa = StringAnalyzer.new 
         test_string = 'abs' 
         expect(sa.has_numbers? test_string).to be false
      end 
      
   end 
end
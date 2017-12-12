require 'rails_helper'

RSpec.configure do |c| 
  c.include CodilityMaxsliceHelper
end

RSpec.describe "MaxSlice Elements" do
  describe "maxprofit" do
    it "maxprofit regular test" do
      a = maxprofit([23171,21011,21123,21366,21013,21367],6)
      expect(a).to eq(356)
    end
    
    it "maxprofit two increasing sequences" do
      a = maxprofit([23171,21011,21123,21366,21013,21367,23171,21011,21123,21366,21013,21368],12)
      expect(a).to eq(2160)
    end

    it "maxprofit after max and before min" do
      a = maxprofit([15,17,18,16,20,5],6)
      expect(a).to eq(5)
    end
  end

  describe "maxSliceSum" do
    it "maxSliceSum regular test" do
      a = maxslicesum([3,2,-6,4,0],5)
      expect(a).to eq(5)
    end
    it "maxSliceSum other test" do
      a = maxslicesum([5,-7,3,5,-2,4,-1],7)
      expect(a).to eq(10)
    end
  end
end

RSpec.describe "Primes" do
  describe "minperimeterrectangle" do
    it "minperimeterrectangle regular test" do
      a = minperimeterrectangle(30)
      expect(a).to eq(22)
    end
    it "minperimeterrectangle min test" do
      a = minperimeterrectangle(1)
      expect(a).to eq(4)
    end  
    it "minperimeterrectangle regular test" do
      a = minperimeterrectangle(28)
      expect(a).to eq(22)
    end        
  end
  
  describe "countfactors" do
    it "countfactors regular test" do
      a = countfactors(24)
      expect(a).to eq(8)
    end    
    it "countfactors minimal test" do
      a = countfactors(1)
      expect(a).to eq(1)
    end    
    it "countfactors regular test" do
      a = countfactors(120)
      expect(a).to eq(16)
    end
       
  end  

  describe "flags" do
    it "flags regular test" do
      a = flags([1,5,3,4,3,4,1,2,3,4,6,2])
      expect(a).to eq(3)
    end   
    it "flags small test" do
      a = flags([10,1,50,2])
      expect(a).to eq(0)
    end   
    it "flags no peaks" do
      a = flags([10,5,8,12])
      expect(a).to eq(0)
    end   
    it "flags three elements" do
      a = flags([10,1,50])
      expect(a).to eq(0)
    end   
  end
end

RSpec.describe "Sieve eratosthenes Elements" do

  describe "countsemiprimes" do
    it "countsemiprimes regular test" do
      a = countsemiprimes(26,[1,4,16],[26,10,20])
      expect(a).to eq([10, 4, 0])
    end 
  end
  
  describe "countnondivisible" do
    it "countnondivisible regular test" do
      a = countnondivisible([3,1,2,3,6], 5)
      expect(a).to eq([2, 4, 3, 2, 0])
    end 
  end

end

RSpec.describe "Euclides" do

  describe "chocolatesbynumbers" do
    it "chocolatesbynumbers regular test" do
      a = chocolatesbynumbers(10, 4)
      expect(a).to eq(5)
    end 
    it "chocolatesbynumbers small test" do
      a = chocolatesbynumbers(2, 1)
      expect(a).to eq(2)
    end 
  end
  
  describe "commonprimedivisors" do
    it "commonprimedivisors regular test" do
      a = commonprimedivisors([15,10,3], [75,30,5], 3)
      expect(a).to eq(1)
    end 
    it "commonprimedivisors regular test" do
      a = commonprimedivisors([2, 1, 2], [1, 2, 2], 3)
      expect(a).to eq(1)
    end 
    it "commonprimedivisors regular test" do
      a = commonprimedivisors([3, 9, 20, 11], [9, 81, 5, 13], 4)
      expect(a).to eq(2)
    end 
  end


end

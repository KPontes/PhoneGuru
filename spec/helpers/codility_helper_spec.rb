require 'rails_helper'

RSpec.configure do |c| 
  c.include CodilityHelper
end

RSpec.describe "Counting Elements" do
  describe "MaxCounter" do
    it "MaxCounter regular test" do
      a = maxCounter(5, [3,4,4,6,1,4,4])
      # puts "Resultado: #{a}"
      expect(a).to eq([3, 2, 2, 4, 2])
    end
    
    it "With 3 maxcounters" do
      a = maxCounter(5, [3,3,6,6,1,3,6])
      expect(a).to eq([3,3,3,3,3])
    end

    it "Minimum array" do
      a = maxCounter(1, [1,2,1,2,1])
      expect(a).to eq([3])
    end
  end
end

RSpec.describe "Prefix Sums" do
  describe "CountDiv" do
    it "CountDiv regular test" do
      a = countDiv(6, 11, 2)
      expect(a).to eq(3)
    end

    it "Large k" do
      a = countDiv(8, 11, 15)
      expect(a).to eq(0)
    end
    it "Equal a b" do
      a = countDiv(10, 10, 5)
      expect(a).to eq(1)
    end
    
    it "Zero a b" do
      a = countDiv(0, 0, 11)
      expect(a).to eq(1)
    end
    
    it "Large b" do
      a = countDiv(11, 345, 17)
      expect(a).to eq(20)
    end    
  end
  
  describe "PassingCars" do
    it "PassingCars regular test" do
      a = passingCars([0,1,0,1,1], 5)
      expect(a).to eq(5)
    end
  end

  describe "GenomicRangeQuery" do
    it "GenomicRangeQuery regular test" do
      a = genomicRangeQuery("CAGCCTA", [2,5,0], [4,5,6])
      expect(a).to eq([2, 4, 1])
    end
  end

end
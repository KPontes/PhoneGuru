require 'rails_helper'

RSpec.configure do |c| 
  c.include CodilityFibonacciHelper
end

RSpec.describe "ladder Elements" do
  describe "ladder" do
    it "ladder regular test" do
      a = ladder([4,4,5,5,1], [3,2,4,3,1], 5)
      expect(a).to eq([6, 2, 10, 2, 0])
    end
    it "ladder one test" do
      a = ladder([7], [3], 1)
      expect(a).to eq( [5])
    end
  end
  describe "absdistinct" do
    it "absdistinct regular test" do
      a = absdistinct([-5,-3,-1,0,3,6], 6)
      expect(a).to eq(5)
    end
    it "absdistinct small negative test" do
      a = absdistinct([-10], 1)
      expect(a).to eq(1)
    end
    it "absdistinct all negative test" do
      a = absdistinct([-2, -2], 2)
      expect(a).to eq(1)
    end
  end
  describe "counttriangles" do
    it "counttriangles regular test" do
      a = counttriangles([10,2,5,1,8,12], 6)
      expect(a).to eq(4)
    end
  end
end  

RSpec.describe "InterviewBit" do
  describe "Binary Tree" do
    it "Runbintree regular test" do
      a = runbintree([10,11,9,5,7,18,17])
      expect(a).to eq({"inOrderTraversal"=>["5", "7", "9", "10", "11", "17", "18"], "Pre-Order Traversal"=>["7", "5", "9", "17", "18", "11", "10"], "Post-Order Traversal"=>["10", "9", "5", "7", "11", "18", "17"]})
    end
  end

  describe "Math" do
    it "Factorization regular test" do
      a = findallfactors(36)
      expect(a).to eq([1,2,3,4,6,9,12,18,36])
    end
    it "DecimaltoBinary regular test" do
      a = decimaltobinary(125)
      expect(a).to eq("1111101")
    end
    it "SievePrimes regular test" do
      a = sieveprimes(25)
      expect(a).to eq([0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0])
    end
    it "Fibonacci regular test" do
      a = generatefibonacci(9)
      expect(a).to eq([1,3,5,7,11,13,17,19,23])
    end
  end

end


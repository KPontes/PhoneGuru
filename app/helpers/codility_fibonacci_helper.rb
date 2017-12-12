require 'binary_search_tree'

module CodilityFibonacciHelper

  # FIBONACCI

  def ladder(a, b, l) # Good answer to combination, but wrong for the statement
    def fact(f)
      return (1..f).reduce(:*) || 1
    end
    arResult = Array[]
    for i in 0..a.size-1
      n = a[i]
      _combinations = fact(n) / (2 * fact(n-2))
      arResult[i] = _combinations % (2**b[i])
    end
    return arResult
  end
  
  def absdistinct(a, n)
    i = 0
    while (i <= a.size-1) do
      if (a[i] >= 0) then break end
      a[i] = a[i].abs
      i+=1
    end
    a.uniq!
    return a.count
  end
  
  def counttriangles(a, n)
    arcomb = a.combination(3).to_a
    _triang = 0
    arcomb.each do |cb|
      if ((cb[0] + cb[1]) > cb[2]) && ((cb[1] + cb[2]) > cb[0]) && ((cb[2] + cb[0]) > cb[1]) then
        _triang += 1
      end
    end
    return _triang    
  end
  
  def runbintree(a)
    bst = BinarySearchTree.new(a[0])
    for i in 1..a.size-1
      bst.insert(a[i])
    end
    # Demonstrating Different Kinds of Traversals
    hTraversals = Hash.new
    hTraversals["inOrderTraversal"] = bst.inOrderTraversal
    hTraversals["Pre-Order Traversal"] = bst.preOrderTraversal
    hTraversals["Post-Order Traversal"] = bst.postOrderTraversal
    return hTraversals
  end

  def findallfactors(n) 
    # Obs. if a number is prime, factors will be only itself and one
    ar = Array[]
    for i in 1..Math.sqrt(n)
      if n%i == 0 then
        ar.push(i)
        if !(i==Math.sqrt(n)) then
          ar.push(n/i)
        end
      end
    end
    return ar.sort
  end
  
  def decimaltobinary(n)
    s = ""
    while n > 0 do
      quotient = n%2
      s = s + quotient.to_s
      n = n/2
    end
    return s.reverse
  end
  
  def sieveprimes(n)
    arPrimes = Array.new(n, 1) #inicializa todos os indices como prime
    arPrimes[0] = 0
    arPrimes[1] = 0
    i = 2
    while (i * i) <= n do
      k = i
      while (k * i) <= n do
        arPrimes[k*i] = 0
        k+=1
      end
      i+=1
    end
    return arPrimes # se a[i]=1 então i = primo
  end
  
  def generatefibonacci(n)
    def fibo(n, arMemo)
      p arMemo
      if (n <= 1) then 
        puts "1111111"
        return n 
      end
      # If we have processed this function before, return the result from the last time. 
      if (arMemo[n] != 0) then 
        puts "22222222"
        return arMemo[n] 
      end
      # Otherwise calculate the result and remember it. 
      arMemo[n] = fibo(n - 1, arMemo) + fibo(n - 2, arMemo)
      return arMemo[n]
    end
    arM = Array.new(n+1, 0)
    puts n
    fibo(n, arM)
    return arM
  end
  
end


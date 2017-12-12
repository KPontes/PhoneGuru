module CodilityHelper
  def binary_gap(n)
    # write your code in Ruby 2.2
    byte = n.to_s(2)
    start = false
    sequencia = 0
    bgap = 0
    for i in 0..byte.length-1
      if byte[i] == "1" then
        start = true
        if sequencia > bgap then
          bgap = sequencia
        end
        sequencia = 0
      end
      if (byte[i] == "0") && (start) then
        sequencia +=1
      end    
    end
    return bgap
  end
  
  def cyclic_rotation(a, k)
    r = Array.new(a.size)
    if a.size <= k then 
      r = a
      return r
    end
    for i in (0..a.size-1) do
      if (i+k <= a.size-1) then
        r[i+k] = a[i]
      end
      if (i < k) then
        r[i] = a[a.size-k+i]
      end
    end
    return r
  end
  
  def odd_ocurrences_in_array(a)
    a.sort!
    i = a.size-1
    if i == 1 then
      return a[i]
    end
    while !a.empty? do
      if a[i] == a[i-1] then
        a.pop
        a.pop
        i-=2
      else
        return a[i]
      end
    end
  end
 
  def perm_missing_element(a)
    a.sort!
    i = 0
    while i <= a.size-1 do
      if a[i] != i+1 then
        return i+1
      else
         i+=1
      end
    end
    return i+1
  end
  
  def frog_jump(x, y, d)
    if (y-x)%d == 0 then
      return (y-x)/d
    else
      return 1+(y-x)/d
    end
  end
  
  def tape_equilibrium(a)
    _sum = 0
    a.each { |a1| _sum+=a1 }
    acum = 0; lowerpart = _sum.abs; _first = false
    for i in 0..a.size-2
      acum += a[i]
      dif = _sum-acum
      if ((acum-dif).abs <= lowerpart.abs) then
        lowerpart = (acum-dif).abs
        _first = true
      else
        if ((acum-dif) < 0) and !(_first) then
          lowerpart = (acum-dif).abs
        end
      end
    end
    return lowerpart
  end
  
  def missingInteger(a)
    a.sort!
    i=0; _last = 1; _first = false
    while i <= (a.size-1) do
      if (a[i] == 1) then
        _first = true
      else
        if (a[i] == _last+1) and (_first) then
          _last = a[i]
        else
          if (a[i] > _last+1) then
            if _first then
              return _last+1
            else
              return _last
            end
          end
        end
      end
      i+=1
    end

    if (i == a.size) then
      i-=1
      if (a.size == 1) then #trata array de 1 elemento
        if (a[i] == 1) 
          _last+=1
        else
           _last = 1
        end
        return _last
      end
      if _last != 1 then 
        return _last+1 
      else
        return _last
      end
    end
  end

  def permCheck(a)
    a.sort!
    i=0; permCheck = 1
    n = a.size
    while i < n do
      if (a[i] != i+1) then
        permCheck = 0
        break
      end
      i+=1
    end
    return permCheck
  end
  
  def frogRiverOne(x, a)
    b = Array.new(x, 0)
    i = 0
    while i < a.size do
      _val = a[i]
      if b[_val-1] == 0 then
        b[_val-1] = i+1
      end
      i+=1
    end

    b.sort!
    if b.include?0 then return -1 end

    return b[b.size-1]-1
  end

  def maxCounter(n, a)
    _counters = Array.new(n, 0)
    _max = 0
    for i in 0..a.size-1
      if a[i] <= n then
        _counters[a[i]-1] += 1
        if _counters[a[i]-1] > _max then
          _max = _counters[a[i]-1]
        end
      else
        n.times do |num|
          _counters[num] = _max
        end
      end
    end
    #puts _counters
    return _counters
  end

  def countDiv(a, b, k)
    _result = 0
    if ((a%k == 0) || (b%k == 0) || k.between?(a, b)) then
      _result +=1
    end
     _result += (b-a)/k
    return _result
  end

  def passingCars(a, n)
    _result = Array.new
    _east = Array.new
    for i in 0..a.size-1
      if a[i] == 0 then
        _east.push(i)
      else
        _west = i
        for j in 0.._east.size-1
          _result.push([_east[j],_west])
        end
      end
    end
    #puts "resultado: #{ _result}"
    return _result.count
  end
  
  def genomicRangeQuery(s, p, q)
    
    _genomic = Array.new
    for i in 0..p.size-1
      _min = "Z"
      _tempStr = s[p[i]..q[i]]
      if _tempStr.include?("A") then
        _genomic[i] = 1
        elsif _tempStr.include?("C") then
           _genomic[i] = 2
        elsif _tempStr.include?("G") then
           _genomic[i] = 3
        else
           _genomic[i] = 4
      end
    end
    return _genomic
  
  end

end


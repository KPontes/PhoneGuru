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

end


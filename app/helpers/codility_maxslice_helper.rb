module CodilityMaxsliceHelper
  
  #MAXSLICE

  def maxprofit(a, n)
    if a.size == 0 then return 0 end
    _maxprofit = Array[]

    for i in 0..a.size-1
      _min = a[0..i].min
      _indexmin = a[0..i].index(_min)
      _max = a[_indexmin..i].max
      (_max - _min) > 0 ? _maxprofit[i] = (_max - _min) : _maxprofit[i] = 0
    end

    return _maxprofit.max
  end
  
  def maxslicesum(a, n)

    if a.size == 0 then return 0 end
    _maxend = Array.new(a.size,0)

    for i in 0..a.size-1
      if i == 0 then
        _maxend[i] = a[i]
      else
        # max antre a[i] e a soma de a[i] com seu anterior ou com o max do endereço anterior
        _maxend[i] = [a[i], (_maxend[i-1]+a[i]), (a[i-1]+a[i])].max
      end
    end

    return _maxend.max
  end
  
  #PRIME
  def minperimeterrectangle(n)
    _limit = (Math.sqrt(n)).floor
    _perimeter = Array[]
    _ind = 0
    for i in 1.._limit
      if (n % i) == 0 then
        a = i
        b = n/i
        _perimeter[_ind] = (a+b)*2
        _ind+=1
      end
    end
    return _perimeter.min
  end

  def countfactors(n)
    _limit = (Math.sqrt(n)).floor
    _factors = Array[]
    _ind = 0

    for i in 1.._limit
      if (n % i) == 0 then
        a = i
        b = n/i
        _factors[_ind] = a
        _factors[_ind+1] = b
        _ind+=2
      end
    end
    return (_factors.uniq).size
  end  
  
  def flags(a)

    _flag = Array.new
    if a.size < 3 then
      return 0 # não tem como haver picos
    end    
    j = 0
    # find flags
    for i in 1..a.size-2
      if (a[i] > a[i-1]) && (a[i] > a[i+1]) then
        _flag[j] = i #insere indice da flag
        j+=1 
      end
    end

    if _flag.size < 2 then
      return 0 # não tem como haver mais de 1 pico
    end
    _maxcount = 0
    # try max flags possible for each n
    n = (Math.sqrt(a.size)).floor

    while n >= 2 do # numero maximo de bandeiras trazidas
      _count = 1
      _ianterior = 0

      for i in 1.._flag.size-1
        if ((_flag[i] - _flag[_ianterior]) >= n) then 
          _count+=1
          _ianterior = i
          if _count == n then  break end
        end
      end
      if _count > _maxcount then _maxcount = _count end
      n-=1
      if _maxcount >= n then break  end #as n is the maximim flags for that round, exit if maxcount is already bigger
    end
    return _maxcount
  end
  
  # SIEVE OF ERATOSTHENES

  def countsemiprimes(n, p, q)
    #treat minimal array
    arResult = Array[]
    if n == 1 then 
      for i in 0..p.size-1
        arResult[i] = 0
      end
      return arResult
    end
    
    # sieve primes
    if n<2 then n=2 end
    arN = Array(2..n)
    arComposite = [0]
    i = 0
    while (arN[i]*arN[i]) <= n do
      k = i
      while (arN[i]*arN[k]) <= n do
        _composite = arN[i]*arN[k]
        arComposite.push(_composite)
        k+=1
      end
      i+=1
    end
    arPrimes = (arN-arComposite)
    arPrimes.sort!

    #monta semiPrimes
    arSemiprime = Array[]
    #_limit = (Math.sqrt(n)).floor
    for i in (0..(1+arPrimes.size/2))
      for j in (i..arPrimes.size-1)
        if (arPrimes[i] * arPrimes[j]) > n then break end
        arSemiprime.push(arPrimes[i] * arPrimes[j])
      end
    end

    # aplica range de P e Q nos semiPrimes
    for i in 0..p.size-1
      _temp = arSemiprime.select { |num| (num>=p[i] && num <=q[i])  } 
      arResult[i] = _temp.size
    end
    return arResult    
  end
  
  def countnondivisible(a, n) 
    # setup divisors of a[i]
    hDivisors = Hash.new
    for i in 0..a.size-1
      j = 1
      _lim = (a[i]/2).floor
      # trata 1 em separado
      if a[i] == 1 then hDivisors[a[i]] = [1] end

      while j <= _lim
        if hDivisors[a[i]] == nil then
          hDivisors[a[i]] = [j]
        else
          if j == 1 then #elemento repetido em a
            break
          end
          if a[i]%j == 0 then
            hDivisors[a[i]].push(j)
          end
        end
        j+=1
      end
      if j != 1 then
        hDivisors[a[i]].push(a[i])
      end
    end

    _result = Array[]
    _tmp = Array[]
    for i in 0..a.size-1
      _tmp[i] = (hDivisors[a[i]] & a)
      _tmp[i] = a - _tmp[i]
      _result[i] = _tmp[i].size
    end

    return _result
    
  end
  
  #EUCLIDES

  def chocolatesbynumbers(n, m)
    armmc = Array[]
    if (m % n) == 0 then
      armmc[0] = m
    else
      armmc[0] = 0
      while (true) do
        x = (armmc[armmc.size-1] + m) 
        if (x % n) != 0 then
          armmc.push(x % n)
        else
          break
        end
      end
    end
    return armmc.size
  end
  
  def chocolatesbynumbersRecursive(n, m)  
    def mmc(a, b, armmc)
      x = (armmc[armmc.size-1] + b) 

      if (x % a) != 0 then
        armmc.push(x % a)
        return mmc(a, b, armmc)
      end
    end
    
    armmc = Array[]
    if (n % m) == 0 then
      armmc[0] = m
    else
      armmc[0] = 0
      mmc(n, m, armmc)
    end
    return armmc.size 
  end
  
  def commonprimedivisors(a, b, z)
    
    def primes(n)
      # sieve primes
      if n<2 then n=2 end
      arN = Array(2..n)
      arComposite = [0]
      i = 0
      while (arN[i]*arN[i]) <= n do
        k = i
        while (arN[i]*arN[k]) <= n do
          _composite = arN[i]*arN[k]
          arComposite.push(_composite)
          k+=1
        end
        i+=1
      end
      return (arN-arComposite)
    end
    
    samePrimeDiv = 0
    # verifica numero de primedivisors para cada par k dos arrays de entrada a e b
    _max = [a.max,b.max].max
    arPrimes = primes(_max)
    p arPrimes
    for k in 0..a.size-1
      # (a[k] > b[k]) ? (arPrimes = arPrimesA) : (arPrimes = arPrimesB)
      primedivA = []
      primedivB = []
      i = 0
      _maxab = 1+([a[k], b[k]].max)/2
      while arPrimes[i] < _maxab do
        if ((a[k] % arPrimes[i]) == 0) then
          primedivA.push(arPrimes[i])
        end
        if ((b[k] % arPrimes[i]) == 0) then 
          primedivB.push(arPrimes[i])
        end
        i+=1
      end
      # insert a[k] if it is prime and is missing in primedivisorsA
      if (arPrimes.include?(a[k])) && !(primedivA.include?(a[k])) then
        primedivA.push(a[k])
      end
      if (arPrimes.include?(b[k])) && !(primedivB.include?(b[k])) then
        primedivB.push(b[k])
      end

      if primedivA == primedivB then
        samePrimeDiv+= 1
      end
    end
    return samePrimeDiv
    
  end
  
end




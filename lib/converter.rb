class Converter

#default givens
NUMERAL_GALAX = { glob: "I", prok: "V", pish: "X", tegj: "L"}
NUMERAL_CREDIT = { I: 1.0, V: 5.0, X: 10.0, L: 50.0}
ORE_CREDIT = { silver: 17.0, gold: 14450.0, iron: 195.5}
#show the algebra that gave these values

  def convert(input_currency)
    if input_currency && validInput?(input_currency)
      input_currency = toArrayOfStrings(input_currency)
      credits, multiplier = correctLookUp(input_currency)
      return credits * (multiplier != 0 ? multiplier : 1)
    else
      raise "I have no idea what you are talking about"
    end
    # check validity of input or raiseerror

  end

  private

  def validInput?(input)
    truthy = nil
    input = toArrayOfStrings(input)
    input.each do |word|
      p word
      # isValid = xor(NUMERAL_GALAX.keys.include?(word), ORE_CREDIT.keys.include?(word))
      truthy = NUMERAL_GALAX.keys.include?(word.to_sym) || ORE_CREDIT.keys.include?(word.to_sym)
      p truthy
    end
    truthy
  end

  def xor(a,b)
  (a and (not b)) or ((not a) and b)
end

  def correctLookUp(input_currency)
    romanValue = ""
    credits = 0
    multiplier = 0
    input_currency.each do |word| #[glob, prok, silver]
      word = word.to_sym
      if NUMERAL_GALAX.keys.include?(word)
        romanValue << NUMERAL_GALAX[word]
        credits = roman_to_integer(romanValue)
        # romanValue = ""
      elsif
        multiplier += ORE_CREDIT[word]
      else
      end
    end
    return credits, multiplier
  end

  def roman_to_integer(str)
  	total = 0
  	left = 0
  	index = str.length - 1
  	while index >= 0
  		key = str[index]
  		index -= 1
  		val = NUMERAL_CREDIT[key.to_sym]
  		if val < left  #this deals with the new roman numeral form
  			val *= -1
  		else
  			left = val
  		end
  		total += val
  	end
    return total
  end

  def toArrayOfStrings(string)
    string.split(" ")
  end


end

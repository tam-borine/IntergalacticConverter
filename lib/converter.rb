require_relative './currencies.rb'

class Converter
include Currencies
#show the algebra that gave these values

  def initialize(argv_text_file)
    @info = argv_text_file
  end

  def convert(input_currency)
    raise "I have no idea what you are talking about" unless input_currency
      input_currency = toArrayOfStrings(input_currency)
      credits, multiplier = correctLookUp(input_currency)
      return credits * (multiplier != 0 ? multiplier : 1)
    # check validity of input or raiseerror

  end

  private


  def correctLookUp(input_currency)
    romanValue = ""
    credits = 0
    multiplier = 0
    input_currency.each do |word| #[glob, prok, silver]
      word = word.to_sym
      if Currencies::NUMERAL_GALAX.keys.include?(word)
        romanValue << Currencies::NUMERAL_GALAX[word]
        credits = roman_to_integer(romanValue)
        # romanValue = ""
      elsif
        multiplier += Currencies::ORE_CREDIT[word]
      else
      end
    end
    return credits, multiplier
  end

  def roman_to_integer(str) #"XLI"
    p str
  	total = 0
  	left = 0
    str = str
  	while str.length > 0
  		key = str[-1]
  		val = Currencies::NUMERAL_CREDIT[key.to_sym]
      str = str.chop
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

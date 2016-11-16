require_relative './currencies.rb'

class Converter
include Currencies
#show the algebra that gave these values

  def initialize(argv_text_file)
    @info = argv_text_file
  end

  def convert_to_credits(currency_to_convert)#"glob prok silver"
    raise "I have no idea what you are talking about" unless currency_to_convert
      currency_to_convert = toArrayOfStrings(currency_to_convert)
      credits, multiplier = look_up_x_rates(currency_to_convert)
      return credits * (multiplier != 0 ? multiplier : 1)
  end

  private

  def look_up_x_rates(currency_to_convert)
    romanValue = ""
    credits = 0
    multiplier = 0
    currency_to_convert.each do |word| #[glob, prok, silver]
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
  	total = 0
  	left = 0
    str = str
  	while str.length > 0
  		key = str[-1]
  		val = Currencies::NUMERAL_CREDIT[key]
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

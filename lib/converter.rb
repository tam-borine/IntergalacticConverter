class Converter

#default givens
NUMERAL_GALAX = { glob: :I, prok: :V, pish: :X, tegj: :L}
NUMERAL_CREDIT = { I: 1.0, V: 5.0, X: 10.0, L: 50.0}
ORE_CREDIT = { silver: 17.0, gold: 14450.0, iron: 195.0}
#show the algebra that gave these values

  def convert(input_currency)
    input_currency = toArrayOfStrings(input_currency)
    values, multiplier = correctLookUp(input_currency)
    p values
    p "in here!"
    p multiplier
    return values.inject(:+) * (multiplier != 0 ? multiplier : 1)
    # check validity of input or raiseerror

  end

  private

  def correctLookUp(input_currency)
    values = []
    multiplier = 0
    input_currency.each do |word| #[glob, prok, silver]
      word = word.to_sym
      if NUMERAL_GALAX.keys.include?(word)
        p "FIRST CALLED"
        # p NUMERAL_CREDIT[NUMERAL_GALAX[word]]
        values << NUMERAL_CREDIT[NUMERAL_GALAX[word]]
      elsif
        p "SECOND CALLED"
        multiplier += ORE_CREDIT[word]
      else
      end
    end
    return values, multiplier
  end

  def toArrayOfStrings(string)
    string.split(" ")
  end


end

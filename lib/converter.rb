class Converter

#default givens
NUMERAL_GALAX = { glob: :I, prok: :V, pish: :X, tegj: :L}
NUMERAL_CREDIT = { I: 1, V: 5, X: 10, L: 50}
ORE_CREDIT = { silver: 17, gold: 14450, iron: 195}
#show the algebra that gave these values

  def convert(input_currency)
    input_currency = toArrayOfStrings(input_currency)
    correctLookUp(input_currency)
    # check validity of input or raiseerror

  end

  private

  def correctLookUp(input_currency)
    values = []
    input_currency.each do |word|
      word = word.to_sym
      if NUMERAL_GALAX.keys.include?(word)
        p "FIRST CALLED"
        p NUMERAL_CREDIT[NUMERAL_GALAX[word]]
        values << NUMERAL_CREDIT[NUMERAL_GALAX[word]]
      elsif
        p "SECOND CALLED"
        values << ORE_CREDIT[word]
      else
      end
    end
    return values
  end

  def toArrayOfStrings(string)
    string.split(" ")
  end


end

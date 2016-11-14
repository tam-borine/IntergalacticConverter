module Currencies #understands the translatory currency maps and how to update them

  #default givens
  NUMERAL_GALAX = { "glob" => "I", "prok" => "V", "pish" => "X", "tegj" => "L"}
  NUMERAL_CREDIT = { "I" => 1.0, "V" => 5.0, "X" => 10.0, "L" => 50.0, "C" => 100.0, "D" => 500.0, "M" => 1000.0}
  ORE_CREDIT = { "silver" => 17.0, "gold" => 14450.0, "iron" => 195.5}

  CURRENCY_MAPS = [NUMERAL_GALAX, NUMERAL_CREDIT, ORE_CREDIT]

  private

  def updateGivens(key, value)
    CURRENCY_MAPS.each do |hash|
      hash[key] = value if hash.keys.include?(key)
    end
  end

end

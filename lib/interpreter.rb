require_relative './currencies.rb'

module Interpreter
  def isInfo?(str)
    return true if /is/.match(str) && (Currencies::CURRENCY_MAPS.each do |hash|
      hash.keys.include?(str)
    end)
  end

  def isQuery?(str)
    /how \b(many|much)\b/.match(str) ? true : false
  end

  def validInput?(input)
    truthy = nil
    # input = toArrayOfStrings(input)
    input.each do |word|
      truthy = Currencies::NUMERAL_GALAX.keys.include?(word.to_sym) || Currencies::ORE_CREDIT.keys.include?(word.to_sym)
    end #refactor this loop so similar to above?
    return truthy
  end
end

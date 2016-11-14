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

  def validInput?(input_array)
    input_array.each do |word|
      return false unless (Currencies::NUMERAL_GALAX.keys.include?(word.to_sym) ||
      Currencies::ORE_CREDIT.keys.include?(word.to_sym))
    end
    return true
  end

end

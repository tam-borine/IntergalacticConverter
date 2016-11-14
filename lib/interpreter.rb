require_relative './currencies.rb'

module Interpreter

  def isInfo?(str)
    hash_names = getMentionedCurrencies(str)
    return true if /is/.match(str)    && currenciesMentionedAreFromDifferentMaps(hash_names)
    return false
  end

  def isQuery?(str)
    /how \b(many|much)\b/.match(str) ? true : false
  end

  def validInput?(input_array)
    input_array.each do |word|
      return false unless (Currencies::NUMERAL_GALAX.keys.include?(word) ||
      Currencies::ORE_CREDIT.keys.include?(word))
    end
    return true
  end

  private

  def getMentionedCurrencies(str)
    hash_names = []
    Currencies::CURRENCY_MAPS.each do |hash| hash_names << hash if hash.keys.any? {|key| str.match(key)}
    end
    return hash_names
  end
#h.fetch( h.keys.find{|key|s[key]} )
  def currenciesMentionedAreFromDifferentMaps(hash_names)
  #   hash_names.each do |name| name
    p hash_names
    hash_names.uniq.length > 1
  end



end
#(Currencies::CURRENCY_MAPS.each do |hash|  hash.keys.include?(str)    end)


#return true if 2 different currencies are mentioned
#str[Regexp.union(hash.keys.to_s)]

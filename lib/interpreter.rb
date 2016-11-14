require_relative './currencies.rb'

def isInfo?(str)
  return true if /is/.match(str) && (Currencies::CURRENCY_MAPS.each do |hash|
    hash.keys.include?(str)
  end)
end

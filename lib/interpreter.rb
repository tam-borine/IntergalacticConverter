require_relative './currencies.rb'

module Interpreter #responsible for understanding the type of input

  #order of checks should be: validInput? isQuery? isInfo?

  def getSubjectFromQueries(queries) #["query". "another query"]
    subjects = []
    queries.each do |query|
      prefix = query[/(how )(many|much) /]
      query.slice!(prefix)
      query.chop! #this is uncool hacky way to remove  ? from str
      subjectsAndObjects = query.split("is")
      subjects << subjectsAndObjects[1]
    end
    return subjects
  end

  def solveForUnknownInfo(info_combo)
    #seperate into subjects and objects
    subjects, objects = [], []
    info_combo.each do |info_str|
      subjectsAndObjects = info_str.split("is")
      subjects << subjectsAndObjects[0]
      objects << subjectsAndObjects[1]
    end
    #decompose and look up values in currencies
    # do algebra for unknowns
    Currencies.updateGivens(key,derived_value)
  end

  def isInfo?(str)
    hash_names = getMentionedCurrencies(str) # "glob is prok"
    return true if /is/.match(str) && currenciesMentionedAreFromDifferentMaps(hash_names)
    return false
  end

  def isQuery?(str)
    /how \b(many|much)\b/.match(str) ? true : false
  end

  def validInput?(input_array)
    input_array.each do |word| #inclusive or for currency relevancy
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

  def currenciesMentionedAreFromDifferentMaps(hash_names)
    # p hash_names
    hash_names.uniq.length > 1
  end

end

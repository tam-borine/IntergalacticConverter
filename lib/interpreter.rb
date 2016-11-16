require_relative './currencies.rb'

module Interpreter #responsible for understanding the type of input
  #order of checks should be: valid_input? is_query? is_info?

  def get_currencies_to_convert_from_queries(queries) #["query". "another query"]
    currencies_to_convert = []
    queries.each do |query|
      prefix = query[/(how )(many|much) /]
      query.slice!(prefix)
      query.chop! #this is uncool hacky way to remove  ? from str
      subjectsAndObjects = query.split("is")
      currencies_to_convert << subjectsAndObjects[1]
    end
    return currencies_to_convert
  end

  def solve_for_unknown_info(info_combo)
    #seperate into subjects and objects
    subjects, objects = get_subjects_and_objects(info_combo)
    #decompose and look up values in currencies
    unknown = []
    knowns = []
    # derived_value = "rand"
    subjects.each do |subject|
      subject = subject.split.map! do |word|
        word = replace_with_value_if_exists(word)
      end
      knowns << subject
    end
    p knowns
    p subjects
    p objects
    # do algebra for unknowns
    # Currencies.update_givens(unknown,derived_value)
    # return get_mentioned_currencies(unknown)
  end

  def is_info?(str)
    hash_names = get_mentioned_currencies(str) # "glob is prok"
    return true if /is/.match(str) && different_currencies_mentioned?(hash_names)
    return false
  end

  def is_query?(str)
    /how \b(many|much)\b/.match(str) ? true : false
  end

  def valid_input?(input_array)
    input_array.each do |word| #inclusive or for currency relevancy
      return false unless (Currencies::NUMERAL_GALAX.keys.include?(word) ||
      Currencies::ORE_CREDIT.keys.include?(word))
    end
    return true
  end

  private

  def replace_with_value_if_exists(word)
    Currencies::CURRENCY_MAPS.each do |hash|
      word = hash[word] if hash.keys.include?(word) #replace the known key with its known value
    end
    return word
  end

  def get_subjects_and_objects(info_combo)
    subjects, objects = [], []
    info_combo.each do |info_str|
      subjectsAndObjects = info_str.split(/\bis\b/)
      subjects << subjectsAndObjects[0]
      objects << subjectsAndObjects[1]
    end
    return subjects, objects
  end

  def get_mentioned_currencies(str)
    hash_names = []
    Currencies::CURRENCY_MAPS.each do |hash|
      hash_names << hash if hash.keys.any? {|key| str.match(key)}
    end
    return hash_names
  end

  def different_currencies_mentioned?(hash_names)
    hash_names.uniq.length > 1
  end

end

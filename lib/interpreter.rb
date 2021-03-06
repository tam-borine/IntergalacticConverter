require_relative './currencies.rb'
require_relative './converter.rb'

module Interpreter #responsible for understanding the type of input
  #order of checks should be: valid_input? is_query? is_info?

  def get_currencies_to_convert_from_queries(queries) #["query". "another query"]
    currencies_to_convert = []
    queries.each do |query|
      prefix = query[/(how )(many|much) /]
      query.chop!.slice!(prefix) #chop is uncool hacky way to remove  ? from str
      currencies_to_convert << get_substr_after_is(query)
    end
    return currencies_to_convert
  end

  def compound_info_to_equation(compound_info, converter = Converter)
    object = get_substr_after_is(compound_info)
    subject = get_substr_before_is(compound_info)
    knowns, unknown = get_knowns_and_unknown(subject)
    known = Converter.new.convert_to_credits(knowns) # UGH!
    # all we need to do algebra and find unknown val is object-credits / known
    "#{known} * #{unknown} = #{object}"
  end

  def get_knowns_and_unknown(compound_subject)
    knowns = []
    unknown = "" #assumes there is only one atm
    compound_subject.split.each do |word|
    recognised_unit?(word) ? knowns << word : unknown = word
    end
    return knowns.join(" "), unknown
  end

  def is_info?(str)
    hash_names = get_mentioned_currencies(str) # "glob is prok"
    /is/.match(str) && different_currencies_mentioned?(hash_names) ? true : false
  end

  def is_compound_info?(str)
    subjects = get_substr_before_is(str)
    is_info?(str) && subjects.split.size > 1
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

  def get_substr_before_is(str)
    str.split(/\bis\b/)[0]
  end

  def get_substr_after_is(str)
    str.split(/\bis\b/)[1]
  end

  def recognised_unit?(word)
      Currencies::CURRENCY_MAPS.each do |hash|
        return true if hash.keys.include?(word)
      end
    false
  end

  def replace_with_value_if_exists(word) #not using this, need it?
    Currencies::CURRENCY_MAPS.each do |hash|
      word = hash[word] if hash.keys.include?(word) #replace the known key with its known value
    end
    return word
  end

  def get_subjects_and_objects(info_combo) #not using this, need it?
    subjects, objects = [], []
    info_combo.each do |info_str|
      subjects << get_substr_before_is(info_str)
      objects << get_substr_after_is(info_str)
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

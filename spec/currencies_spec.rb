require 'currencies'

RSpec.describe Currencies do

  def hashDoesIncludeValueAtKey(hash, key, value)
    hash.any? {|k, v| k == key && v == value}
  end

  it "updates default conversion hash maps with new information" do
    pending "test passes but need to keep pending until I decide what default values should be"
    expect(hashDoesIncludeValueAtKey(described_class::NUMERAL_GALAX, :glob, "I")).to be false
    subject.send(:updateGivens, :glob, "I")
    expect(hashDoesIncludeValueAtKey(described_class::NUMERAL_GALAX, :glob, "I")).to be true
  end
  
end

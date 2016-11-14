require 'interpreter'

RSpec.describe "interpreter" do
  describe "interpreter" do

    def hashDoesIncludeValueAtKey(hash, key, value)
      hash.any? {|k, v| k == key && v == value}
    end

    it "raises error for invalid input"
    it "inputs are queries if include substring 'how[much/many]'"

    it "inputs are info (thus passed to updateGivens) if include substr 'is' and mention >= 2 different currencies" do
      expect(subject.send(:isInfo?, "pish pish Iron is 3910 Credits")).to eq true
      #add edge case for DIFFERENT currencies
    end

    it "updates default conversion hash maps with new information" do
      pending "test passes but need to keep pending until I decide what default values should be"
      expect(hashDoesIncludeValueAtKey(described_class::NUMERAL_GALAX, :glob, "I")).to be false
      subject.send(:updateGivens, :glob, "I")
      expect(hashDoesIncludeValueAtKey(described_class::NUMERAL_GALAX, :glob, "I")).to be true
    end

    it "does algebra"
  end
end

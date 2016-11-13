require 'converter'

RSpec.describe Converter do
let(:text_file){"pish pish Iron is 3910 Credits \n
how much is pish tegj glob glob ? \n
how many Credits is glob prok Silver ?"}

subject {described_class.new(text_file)}

  describe "feature tests" do

    it "pish tegj glob glob is 42" do
      expect(subject.convert("pish tegj glob glob")).to eq(42.0)
    end

    it "glob prok silver is 68 credits" do
      expect(subject.convert("glob prok silver")).to eq(68)
    end

    it "glob prok gold is 57800 credits" do
      expect(subject.convert("glob prok gold")).to eq(57800)
    end

    it "glob prok iron is 782 credits" do
      expect(subject.convert("glob prok iron")).to eq(782)
    end

    it "raises error for invalid input" do
      expect{subject.convert(nil)}.to raise_error "I have no idea what you are talking about"
    end
  end

  describe "interface" do

    def hashDoesIncludeValueAtKey(hash, key, value)
      hash.any? {|k, v| k == key && v == value}
    end

    it "raises error for invalid input"
    it "inputs are queries if include substring 'how[much/many]'"

    it "inputs are info (thus passed to updateGivens) if include substring 'is' and mention at least 2 different currencies" do
      expect(subject.send(:isInfo?, "pish pish Iron is 3910 Credits")).to eq true
    end

    it "updates default conversion hash maps with new information" do
      pending "test passes but need to keep pending until I decide what default values should be"
      expect(hashDoesIncludeValueAtKey(described_class::NUMERAL_GALAX, :glob, "I")).to be false
      subject.send(:updateGivens, :glob, "I")
      expect(hashDoesIncludeValueAtKey(described_class::NUMERAL_GALAX, :glob, "I")).to be true
    end

    it "does algebra"
  end

  describe "#roman_to_integer" do

    it "old roman numerals are simply translated and summed" do
      expect(subject.send(:roman_to_integer,"MMVI")).to eq(2006)
      #add more cases here
    end

    it "new roman numerals are calculated correctly" do
      expect(subject.send(:roman_to_integer, "MMIV")).to eq(2004)
      #add more cases here
    end

    it "D, L, and V can never repeat"
    it "I, X, C, and M can repeat three times max in succession"
    it "I, X, C, and M can repeat four times if succession is broken by another symbol"
    it "I can be subtracted from V and X only"
    it "X can be subtracted from L and C only"
    it "C can be subtracted from D and M only"
    it "V, L and D can never be subtracted"


  end



end

require 'converter'

RSpec.describe Converter do
subject {described_class.new}

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
    expect{subject.convert(nil)}.to raise "I have no idea what you are talking about"

  end


end

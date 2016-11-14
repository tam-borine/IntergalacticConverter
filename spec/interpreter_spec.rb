require 'interpreter'

RSpec.describe Interpreter do

    let(:interpreter) { Class.new { extend Interpreter } } #this is how to test modules

    it "raises error for invalid input" do
      expect(interpreter.validInput?(["prok", "glob"])).to eq true
      expect(interpreter.validInput?(["cheese", "prok", "glob"])).to eq false
    end

    it "inputs are queries if include substr 'how[much/many]'" do
      expect(interpreter.isQuery?("pish pish Iron is 3910 Credits")).to eq false
      expect(interpreter.isQuery?("how many Credits is glob prok Gold ?")).to eq true
    end

    it "inputs are info if include substr 'is' and mention >= 2 different currencies" do
      expect(interpreter.isInfo?("pish pish Iron is 3910 Credits")).to eq true
      expect(interpreter.isInfo?("pish is glob")).to eq false
      #add edge case for DIFFERENT currencies
    end

    it "does algebra"

end

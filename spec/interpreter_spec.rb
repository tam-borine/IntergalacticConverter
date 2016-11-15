require 'interpreter'

RSpec.describe Interpreter do

    let(:interpreter) { Class.new { extend Interpreter } } #this is how to test modules

    it "raises error for invalid input" do
      expect(interpreter.validInput?(["prok", "glob"])).to eq true
      expect(interpreter.validInput?(["cheese", "prok", "glob"])).to eq false
      expect(interpreter.validInput?(["how much garbage is in garbage?"])).to eq false

    end

    it "inputs are queries if include substr 'how[much/many]'" do
      expect(interpreter.isQuery?("pish pish Iron is 3910 Credits")).to eq false
      expect(interpreter.isQuery?("how much is pish tegj glob glob ?")).to eq true
      expect(interpreter.isQuery?("how many Credits is glob prok Gold ?")).to eq true
    end

    it "inputs are info if include substr 'is' and mention >= 2 different currencies" do
      expect(interpreter.isInfo?("pish pish Iron is 3910 Credits")).to eq true
      expect(interpreter.isInfo?("pish is glob")).to eq false
      expect(interpreter.isInfo?("glob is I")).to eq true
    end

    it "splits query into subjects and objects on 'is'" do
      query = ["how many Credits is glob prok Silver ?"]
      expect(interpreter.getSubjectFromQueries(query)).to eq ["Credits"]
    end

#, "how much is pish tegj glob glob ?"

    it "does algebra"

end

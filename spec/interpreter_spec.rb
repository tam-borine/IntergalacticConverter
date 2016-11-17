require 'interpreter'

RSpec.describe Interpreter do

    let(:interpreter) { Class.new { extend Interpreter } } #this is how to test modules

    it "raises error for invalid input" do
      expect(interpreter.valid_input?(["prok", "glob"])).to eq true
      expect(interpreter.valid_input?(["cheese", "prok", "glob"])).to eq false
      expect(interpreter.valid_input?(["how much garbage is in garbage?"])).to eq false

    end

    it "inputs are queries if include substr 'how[much/many]'" do
      expect(interpreter.is_query?("pish pish Iron is 3910 Credits")).to eq false
      expect(interpreter.is_query?("how much is pish tegj glob glob ?")).to eq true
      expect(interpreter.is_query?("how many Credits is glob prok Gold ?")).to eq true
    end

    it "inputs are info if include substr 'is' and mention >= 2 different currencies" do
      expect(interpreter.is_info?("pish pish Iron is 3910 Credits")).to eq true
      expect(interpreter.is_info?("pish is glob")).to eq false
      expect(interpreter.is_info?("glob is I")).to eq true
    end

    it "inputs are compound info if are info and have more than one subject" do
      expect(interpreter.is_compound_info?("pish pish Iron is 3910 Credits")).to eq true
      expect(interpreter.is_compound_info?("glob is I")).to eq false

    end

    it "splits query into subjects and objects on 'is'" do
      query = ["how many Credits is glob prok Silver ?", "how many Credits is glob prok Iron ?"]
      expect(interpreter.get_currencies_to_convert_from_queries(query)).to eq [" glob prok Silver ", " glob prok Iron "]
    end

    it "gets known and unknown values" do
      compound_subject = "pish pish Iron"
      expect(interpreter.get_knowns_and_unknown(compound_subject)).to eq ["pish pish", "Iron"]
    end

    it "converts compound info into an equation" do
      compound_info = "glob glob Silver is 34 Credits"
      expect(interpreter.compound_info_to_equation(compound_info)).to eq "2.0 * Silver =  34 Credits"
    end

    it "does algebra" do
      pending "probably need to break this into a few smaller methods with more isolated responsibilities"
      info_combo = ["glob glob Silver is 34 Credits","pish pish Iron is 3910 Credits","glob prok Gold is 57800 Credits"]
      expect(interpreter.solve_for_unknown_info(info_combo)).to eq Currencies::ORE_CREDIT
    end

end

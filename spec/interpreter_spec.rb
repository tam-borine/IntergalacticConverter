require 'interpreter'

RSpec.describe "interpreter" do

    it "raises error for invalid input"
    it "inputs are queries if include substring 'how[much/many]'"

    it "inputs are info (thus passed to updateGivens) if include substr 'is' and mention >= 2 different currencies" do
      expect(subject.send(:isInfo?, "pish pish Iron is 3910 Credits")).to eq true
      #add edge case for DIFFERENT currencies
    end

    it "does algebra"
  
end

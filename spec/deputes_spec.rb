require_relative '../lib/deputes'

describe "open_nokogiri" do
  it "must return something which is not nil" do
    expect(open_nokogiri("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique")).not_to be(nil)
  end
end

describe "deputes_email" do
  it "must return an e-mail adress" do
    expect(deputes_email("https://www.assemblee-nationale.fr/dyn/deputes/PA795950")).to eq("david.amiel@assemblee-nationale.fr")
  end
  it "must return an e-mail adress" do
    expect(deputes_email("https://www.assemblee-nationale.fr/dyn/deputes/PA342240")).to eq("jean-luc.bourgeaux@assemblee-nationale.fr")
  end
end

# describe "internet_webpage_deputes" do
#   it "must return an hash" do
#     expect(internet_webpage_deputes(("https://www2.assemblee-nationale.fr/deputes/liste/alphabetique").class)).to eq("Array")
#   end
# end

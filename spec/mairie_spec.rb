require_relative '../lib/mairie'

describe "open_nokogiri" do
  it "must return something which is not nil" do
    expect(open_nokogiri("http://annuaire-des-mairies.com/val-d-oise.html")).not_to be(nil)
  end
end

describe "get_townhall_email" do
  it "must return an e-mail adress" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/95/bezons.html")).to eq("courrier@mairie-bezons.fr")
  end
  it "must return an e-mail adress" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/marly-la-ville.html")).to eq("")
  end
  it "must return an e-mail adress" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/la-roche-guyon.html")).to eq("mairie.larocheguyon@wanadoo.fr")
  end

  # describe "get_townhall_urls" do
  #   it "with all department of vald'oise, it must return an array" do
  #     expect((get_townhall_email("https://www.annuaire-des-mairies.com/val-d-oise.html")).class).to eq("Array")
  #   end
end


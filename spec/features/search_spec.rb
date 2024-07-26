require "rails_helper"

RSpec.describe "Search Page", type: :feature do
  before :each do
    json_response = File.read("spec/fixtures/fire_nation.json")

    stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=Fire+Nation")
    .with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v2.9.0'
      })
    .to_return(status: 200, body: json_response)

    # stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=").to_return(status: 200, body: "[]")

    visit search_path(affiliation: "Fire Nation")
  end

  it "displays nation details" do
    expect(page).to have_content("Members Fire Nation")
    expect(page).to have_content(20)

    expect(page).to have_css(".character", maximum: 25)
    expect(page).to have_content("Name", maximum: 25)
    expect(page).to have_content("Allies", maximum: 25)
    expect(page).to have_content("Enemies", maximum: 25)
    expect(page).to have_content("Affiliations", maximum: 25)
  end
end
require "rails_helper"

RSpec.describe CharacterService do
  it "can get characters for a nation" do
    json_response = File.read("spec/fixtures/fire_nation.json")

    stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=Fire+Nation").to_return(status: 200, body: json_response)

    characters = CharacterService.get_characters_for("Fire+Nation")

    expect(characters).to be_an(Array)
    expect(characters).to all(be_a(Hash))
  end
end
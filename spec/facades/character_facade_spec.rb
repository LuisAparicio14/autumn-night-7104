require "rails_helper"

RSpec.describe CharacterFacade do
  it "can search for members of a nation" do
    json_response = File.read("spec/fixtures/fire_nation.json")

    stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=Fire+Nation").to_return(status: 200, body: json_response)

    characters = CharacterFacade.search_of("Fire Nation")

    expect(characters).to all(be_a(Character))
  end
end
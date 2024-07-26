require "rails_helper"

RSpec.describe "welcome page", type: :feature do
  describe "As a visitor" do
    it "form with an option to select a nation" do
      json_response = File.read("spec/fixtures/characters.json")
      stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=Fire+Nation").to_return(status: 200, body: json_response)
      visit root_path

      expect(page).to have_content("Fire Nation")
      expect(page).to have_button("Search For Members")

      select 'Fire Nation', from: :nation
      click_button "Search For Members"
      expect(current_path).to eq(search_path)
    end
  end
end
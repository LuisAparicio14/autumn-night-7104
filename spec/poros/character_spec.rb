require "rails_helper"

RSpec.describe Character do
  it "can create a character object" do
    data = {
      "allies": [
        "Fire Nation"
      ],
      "enemies": [
        "Aang"
      ],
      "_id": "5cf5679a915ecad153ab68cc",
      "photoUrl": "https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128",
      "name": "Afiko",
      "gender": "Male",
      "hair": "Brown",
      "weapon": "Air",
      "profession": "Monk",
      "position": " Airbending master Traitor",
      "affiliation": "Fire Nation",
      "first": "Avatar: The Last Airbender Trading Card Game"
    }

    character = Character.new(data)

    expect(character).to be_a Character
    expect(character.name).to eq("Afiko")
    expect(character.photo).to eq("https://vignette.wikia.nocookie.net/avatar/images/2/24/Afiko.png/revision/latest?cb=20121121024128")
    expect(character.allies).to eq(["Fire Nation"])
    expect(character.enemies).to eq(["Aang"])
    expect(character.affiliation).to eq("Fire Nation")
  end
end
class CharacterService
  def self.get_characters_for(affiliation)
    get_url("/api/v1/characters?affiliation=#{affiliation}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://last-airbender-api.fly.dev")
  end
end
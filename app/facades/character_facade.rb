class CharacterFacade
  def self.search_of(affiliation)
    json = CharacterService.get_characters_for(affiliation)
    
    json.map do |member_data|
      Character.new(member_data)
    end
  end
end
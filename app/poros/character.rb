class Character
  attr_reader :name, :photo, :allies, :enemies, :affiliation

  def initialize(attributes)
    @name = attributes[:name]
    @photo = attributes[:photoUrl]
    @allies = attributes[:allies]
    @enemies = attributes[:enemies]
    @affiliation = attributes[:affiliation]
  end
end
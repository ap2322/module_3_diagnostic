class PotterSearch
  attr_reader :members
  def initialize(search)
    @search_term = search
    @members = fetch_characters
  end

  def fetch_characters
    harrypotterapi = HarryPotterService.new
    character_hash ||= harrypotterapi.find_order_member(@search_term)
    characters_from_json(character_hash)
  end

  private
  def characters_from_json(characters_hash)
    characters_hash.map do |character|
      Character.new(character)
    end
  end
end

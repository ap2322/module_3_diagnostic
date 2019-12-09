class SearchController < ApplicationController
  def index
    harrypotterapi = HarryPotterService.new
    character_hash = harrypotterapi.find_order_member(params[:house])
    @members_in_order = characters_from_json(character_hash)
  end

  private
  def characters_from_json(characters_hash)
    characters_hash.map do |character|
      Character.new(character)
    end
  end
end

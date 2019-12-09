class SearchController < ApplicationController
  def index
    render locals: { members_in_order: PotterSearch.new(params[:house]).members}
  end
end

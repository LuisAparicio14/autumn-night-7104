class SearchController < ApplicationController
  def index
    @affiliation = params[:affiliation]
    @members = CharacterFacade.search_of(@affiliation)
  end
end
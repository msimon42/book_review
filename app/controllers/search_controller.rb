class SearchController < ApplicationController
  def index
    @book_info = OpenLibraryService.new.book_search(params[:title])
  end
end

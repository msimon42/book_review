class SearchController < ApplicationController
  def index
    @book_info = OpenLibraryService.new.book_search(params[:title])
    @review_info = NytService.new.get_reviews(params[:title])
  end
end

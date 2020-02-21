require 'rails_helper'

feature OpenLibraryService do
  feature 'methods' do
    scenario 'book_search', :vcr do
      title = 'Normal People'

      expected = {title: 'Normal People', author: 'Sally Rooney', genre: 'work'}
      actual = OpenLibraryService.new.book_search('Normal People')

      expect(actual).to eq(expected)
    end
  end
end

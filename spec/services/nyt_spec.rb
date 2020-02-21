require 'rails_helper'

feature NytService do
  feature 'methods' do
    scenario 'reviews', :vcr do
      title = 'Normal People'""
      expected = {review_count: '2', reviews: ["Rooney’s second novel tracks two gifted but troubled teenagers across four years of friendship and occasional romance.", "Like “Conversations With Friends,” “Normal People” also traces a young romance in Ireland."]}
      actual = NytService.new.get_reviews(title)

      expect(actual).to eq(expected)
    end
  end
end

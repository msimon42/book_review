class NytService
  def get_reviews(title)
    params = {'title' => title, 'api-key' => ENV['NYT_KEY']}
    result = get_json('https://api.nytimes.com/svc/books/v3/reviews.json', params)

    output = {
      review_count: result['num_results'].to_s,
      reviews: parse_reviews(result['results'])
    }
  end

  private
    def connection
      Faraday.new(url: 'https://api.nytimes.com/svc/books/v3/reviews.json') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def get_json(url, params)
      response = connection.get(url, params)
      JSON.parse(response.body)
    end

    def parse_reviews(json_output)
      json_output.map do |review|
        review['summary'].to_s
      end
    end
end

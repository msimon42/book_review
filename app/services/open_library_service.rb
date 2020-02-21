class OpenLibraryService
  def book_search(title)
    result = get_json('https://openlibrary.org/search.json',{title: title})
    output = {
      title: result['docs'][0]['title'],
      author: result['docs'][0]['author_name'][0],
      genre: result['docs'][0]['type']
    }
  end

  private
    def connection
      Faraday.new(url: 'https://openlibrary.org/search.json') do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def get_json(url, params)
      response = connection.get(url, params)
      JSON.parse(response.body)
    end
end

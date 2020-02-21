class OpenLibraryService
  def book_search(title)
    result = get_json({title: title})
    output = {
      title: result['docs']['title'],
      author: result['docs']['author'],
      genre: result['docs']['genre']
    }

  private
    def connection
      Faraday.new(url: 'https://openlibrary.org/search.json') do |f|
        f.default_adapter Faraday.default_adapter
      end
    end

    def get_json(params)
      response = connection.get(params)
      json.parse(response.body)
    end
end

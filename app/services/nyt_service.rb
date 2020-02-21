class NytService
  private
    def connection
      Faraday.new(url: 'https://api.nytimes.com/svc/books/v3') do |f|
        f.adapter Faraday.default_adapter
      end
    end
end

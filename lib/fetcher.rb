class Fetcher
  def initialize(limit_data_items)
    @resolver = Resolver.new limit_data_items
  end

  def result
    # Some methods that parse the JSON raw result, like:
    # result = ResultParser.new(result).parse
    @resolver.fetch_net_request
  end

  class Resolver
    require 'httparty'

    ENDPOINT = 'https://www.reddit.com/r/news.json'.freeze
    DEFAULT_LIMIT_ITEMS = 25

    def initialize(limit_data_items)
      @limit_data_items = parse(limit_data_items)
    end

    def fetch_net_request
      response = HTTParty.get(url)
      # remember to do something here with the @limit_data_items
      # Maybe you don't want to fetch all the results, just the subset indicated by
      # the @limit_data_items attribute.
      response.parsed_response
    end

    private

    def parse(limit_items_data)
      return limit_items_data if limit_items_data.is_a?(Integer)

      DEFAULT_LIMIT_ITEMS
    end

    def url
      @url ||= "#{ENDPOINT}?limit=#{@limit_data_items}"
    end
  end
end

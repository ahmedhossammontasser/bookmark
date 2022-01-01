class BitlyShortenService
    def initialize()
        @client = Bitly::API::Client.new(token: ENV.fetch("BITLY_TOKEN"))
    end

    def get_shorten_lnk(url_text)
        bitlink = @client.shorten(long_url: url_text)
        return bitlink.link
    end

end
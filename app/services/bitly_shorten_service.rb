class BitlyShortenService
    '''
        create Bitly::API::Client obj that will be used in rest of functions
    '''
    def initialize()
        @client = Bitly::API::Client.new(token: ENV.fetch("BITLY_TOKEN"))
    end

    '''
        use Bitly::API::Client api to shorten url 
        return shorten_link as text 
    '''
    def get_shorten_lnk(url_text)
        bitlink = @client.shorten(long_url: url_text)
        return bitlink.link
    end

end
class SiteService
    '''
        set site_url and uri using URI libary
    '''
    def initialize(site_url)
        @site_url = site_url
        @uri = URI.parse(site_url)
    end
    
    '''
        check if url is valid website
        return true if valid else raise exception
    '''
    def working_url?()
        if  @uri.is_a?(URI::HTTP) && !@uri.host.nil?
            return true
        end
        raise Exception.new "Invalid Url"
    end

    '''
        return site obj if url is valid url
        else return exception invalid
    '''
    def get_create_site()
        if self.working_url?()
            title = @uri.host.gsub("www.", "").gsub(".com", "")
            url = @uri.scheme + "://" + @uri.host
            site = Site.create_or_find_by( title: title, url: url )
            if site.save
                return site
            else
                raise Exception.new "Invalid Url"
            end
            
        end
    end

end
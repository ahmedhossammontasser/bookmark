class SiteService
    def initialize(site_url)
        @site_url = site_url
        @uri = URI.parse(site_url)
    end
    
    def working_url?()
        if  @uri.is_a?(URI::HTTP) && !@uri.host.nil?
            return true
        end
        raise Exception.new "Invalid Url"
    end

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
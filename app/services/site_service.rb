# require 'URI'
# require 'uri'


class SiteService
    def self.working_url?(url)
        uri = URI.parse(url)
        if  uri.is_a?(URI::HTTP) && !uri.host.nil?
            return true
        end
        raise Exception.new "Invalid Url"
    end

    def self.get_create_site(site_url)
        if SiteService.working_url?(site_url)
            uri = URI.parse(site_url)
            title = uri.host.gsub("www.", "").gsub(".com", "")
            url = uri.scheme + "://" + uri.host
            site = Site.create_or_find_by( title: title, url: url )
            if site.save
                return site
            else
                raise Exception.new "Invalid Url"
            end
            
        end
    end

end
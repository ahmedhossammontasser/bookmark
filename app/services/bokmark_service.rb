
class BokmarkService
    def initialize(bokmark_params, parent_id, current_user)
        @bokmark = Bokmark.new(bokmark_params)
        @bokmark.parent_id = parent_id
        @bokmark.user_id = current_user.id            
        if @bokmark.bookmark_type == "file"
            @bokmark.site = SiteService.new(@bokmark.url_text).get_create_site()
            @bokmark.shorten_url = BitlyShortenService.new().get_shorten_lnk(@bokmark.url_text)
        end
    end

    def verify()
        if @bokmark.parent_id.nil?
            raise Exception.new "Parent Id can not be nil"
        else
            if @bokmark.parent.user != @bokmark.user
                raise Exception.new "Parent Bookmark does not belong to same user"
            end
            if @bokmark.parent.bookmark_type == "file"
                raise Exception.new "Parent Bookmark can't be file type"
            end
        end
        return true
    end

    def get_bokmark_obj( )
        if self.verify()
            return @bokmark
        end 
    end 
end
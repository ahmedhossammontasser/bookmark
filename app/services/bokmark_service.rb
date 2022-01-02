
class BokmarkService
    '''
        create new bokmark object 
        and if bookmark_type is file, 
            set site using site_service 
            and shorten_url using bitly_shorten_service
    '''
    def initialize(bokmark_params, current_user)
        @bokmark = Bokmark.new(bokmark_params)
        @bokmark.user_id = current_user.id            
        if @bokmark.bookmark_type == "file"
            @bokmark.site = SiteService.new(@bokmark.url_text).get_create_site()
            @bokmark.shorten_url = BitlyShortenService.new().get_shorten_lnk(@bokmark.url_text)
        end
    end

    '''
        Verify: 
            - parent_id is not null ( every bokmark should have parent_id expect the first(root) bokmark for each user)
            - bokmark and parent bookmark should belong to same user 
            - bokmark should always have parent with folder as bokmark type
    '''
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

    '''
        return bokmark obj after verifying it
    '''
    def get_bokmark_obj( )
        if self.verify()
            return @bokmark
        end 
    end 
end
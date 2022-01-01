
class BokmarkService
    
    def self.new_bokmark(bokmark_params, parent_id, current_user)
        bokmark = Bokmark.new(bokmark_params)
        site_obj_id = nil
        if bokmark.bookmark_type == "file"
            site_obj = SiteService.get_create_site(bokmark.url_text)
            bokmark.site = site_obj            
        end
        if parent_id.nil?
            raise Exception.new "Parent Id can not be nil"
        else
            bokmark.parent_id = parent_id
            if bokmark.parent.user != current_user
                raise Exception.new "Parent Bookmark does not belong to same user"
            end
            if bokmark.parent.bookmark_type == "file"
                raise Exception.new "Parent Bookmark can't be file type"
            end
        end
        bokmark.user_id = current_user.id
        return bokmark
    end 
end
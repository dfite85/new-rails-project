module WikisHelper
                                                                                #there is a whole bunch of shit i need to write in here to authorize users
    
    def user_is_authorized_to_create?                                           #ok.. so i need a def to see if user is authorized to create
        current_user          #user && admin or paying member... so everyone
    end
    
    def user_is_authorized_to_update?                                           #def authorized to update
        current_user                                                            #if you are the current user of the wiki
    end
    
    def user_is_authorized_to_delete?                                           #def authorised to delete
        current_user && (current_user == @wiki.user || current_user.admin?)     #post owner & admin
    end
end

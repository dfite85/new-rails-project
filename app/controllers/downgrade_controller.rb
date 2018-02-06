class DowngradeController < ApplicationController
    
    def new
    end
    
    def create
        
        current_user.update_attribute(:role, 'standard')
        wikis = Wiki.all
        wikis.each do |wiki|
        	wiki.update_attribute(:private, false)
        	
        end
        
        flash[:notice] = "You are no longer awesome!."
        
        redirect_to root_path
    end
end

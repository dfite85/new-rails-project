class WikisController < ApplicationController
                                                                                #if i had a dollar for every time i typed wookie instead of wiki.. I should change it, but Disney might sue me.
                                                                                #the ReadMe.md was killer for helping with the @wiki info
    def index
        @wikis = Wiki.all                                                       #this S kicked my ass
    end
    
    def show
        @wiki = Wiki.find(params[:id])
    end
    
    def new
        @wiki = Wiki.new
        #authorize @wikis                                                       #not sure i need one here but why not
    end
    
    def create
        @wiki = Wiki.new
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
        @wiki.user = current_user
        #authorize @wiki                                                          #authorizes current user to create 
        
        if @wiki.save
            flash[:notice] = "Your shit was saved."                             #haha i missed these
            redirect_to @wiki                                                   #redirect back to wiki
            
        else                                                                    #did not save
            flash.now[:alert] = "Your shit was not saved."                      #alert
            render :new                                                         #back to a new wiki to try again
        end
    end
    
    def edit
        @wiki = Wiki.find(params[:id])
        #authorize @wikis                                                       #need some authorize shit here to so unallowed fellows cannot edit a post
    end
    
    def update
        @wiki = Wiki.find(params[:id])
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
    end
    
    def destroy
        @wiki = Wiki.find(params[:id])
        #authorize @wikis                                                       #authorize to destroy wiki
        
        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was obliterated!"
            redirect_to wikis_path
            
        else
            flash.now[:alert] = "This Wiki is indestructible, try harder!"
            render :show
        end
    end
    
end

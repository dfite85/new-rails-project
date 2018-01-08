class WikisController < ApplicationController
                                                                                #if i had a dollar for every time i typed wookie instead of wiki
    def index
        @wikis = Wiki.all                                                       #this S kicked my ass for abit
    end
    
    def show
        @wiki = Wiki.find(params[:id])
    end
    
    def new
        @wiki = Wiki.new
    end
    
    def create
        @wiki = Wiki.new
        @wiki.tilte = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
        
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
    end
    
    def update
        @wiki = Wiki.find(params[:id])
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
    end
    
    def destroy
        @wiki = Wiki.find(params[:id])
        
        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was obliterated!"
            redirect_to wikis_path
            
        else
            flash.now[:alert] = "This Wiki is indestructible, try harder!"
            render :show
        end
    end
    
end

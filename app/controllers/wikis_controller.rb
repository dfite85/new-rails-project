
include ApplicationHelper

class WikisController < ApplicationController

    def index
        @wikis = policy_scope(Wiki)
    end
    
    def show
        @wiki = Wiki.find(params[:id])
        if current_user.present?
            collaborators = []
            @wiki.collaborators.each do |collaborator|
                collaborators << collaborator.email
        end
        unless (@wiki.private == false) || @wiki.user == current_user || collaborators.include?(current_user.email) || current_user.admin?
            flash[:alert] = "You are not authorized to view this wiki."
            redirect_to new_charge_path
        end
        else
          flash[:alert] = "You are not authorized to view this wiki."
          redirect_to new_user_registration_path
        end
    end
    
    def new
        @wiki = Wiki.new
    end
    
    def create
        @wiki = Wiki.new(wiki_params)
        @wiki.user = current_user
        
        if @wiki.save
            @wiki.collaborators = Collaborator.update_collaborators(params[:wiki][:collaborators])
            flash[:notice] = "Your shit was saved."
            redirect_to @wiki
            
        else
            flash.now[:alert] = "Your shit was not saved."
            render :new
        end
    end
    
    def edit
        @wiki = Wiki.find(params[:id])
    end
    
    def update
        @wiki = Wiki.find(params[:id])
        @wiki.assign_attributes(wiki_params)
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
    
    private 
    
    def wiki_params
        params.require(:wiki).permit(:title, :body, :private)
    end
    
end

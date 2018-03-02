include ApplicationHelper
class CollaboratorsController < ApplicationController
  def destroy
    wiki = Wiki.find(params[:wiki_id])
    wiki.collaborators.delete(params[:collaborator_id])
    
    redirect_to wiki
  end
end
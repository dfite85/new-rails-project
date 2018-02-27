
class CollaboratorsController < ApplicationController
    
def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "You removed a collaborator"
    else
      flash[:error] = "There was a problem removing this collaborator"
    end

    redirect_to wiki_collaborators_path(@wiki)
end
end
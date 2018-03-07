
class CollaboratorsController < ApplicationController
  include ApplicationHelper
  def destroy
    collaborator = Collaborator.find(params[:collaborator_id])

    if collaborator.destroy
      flash[:success] = "Successfully removed collaborator"
    else
      flash[:alert] = "There was a problem removing the collaborator."
    end

  redirect_to wiki
  end
end
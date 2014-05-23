class CollaboratorsController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Sharedwiki.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = current_user.wikis.build(collaborator_params)
    @collaborator.wiki = @wiki
    if @collaborator.save
      redirect_to collaborators_path, notice: 'Collaborator added successfully'
    else
      flash[:notice] = 'Error adding Collaborator. Please try again.'
      render :new
    end
  end

  def destroy
  end


  private
  def collaborator_params
    params.require(:sharedwikis).permit(:wiki_id, :user_id)
  end
end

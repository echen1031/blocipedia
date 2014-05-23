class CollaborationsController < ApplicationController
  before_filter :set_wiki

  def index
    @wiki_collaborators = @wiki.collaborator
    @users = User.all
  end

  def new
    @collaborator = Collaboration.new
  end

  def create
    @collaborator = User.find_by_username(params[:username])
    @collaboration = @wiki.collaborations.build(user_id: @collaborator.id)
    
    
    
    if WikiPolicy.new(@wiki).allow_to_add_collaboration?(@collaboration) && @collaboration.save
      redirect_to wiki_collaborations_path(@wiki), notice: 'Collaborator added successfully'
    else
      flash[:notice] = 'Error adding Collaborator. Please try again.'
      render :new
    end
  end

  def destroy
  end


  private
  
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end

end

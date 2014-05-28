class CollaborationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_wiki

  def index
    @wiki_collaborators = @wiki.collaborators
  end

  def new
    @collaborator = Collaboration.new
  end

  def create
    @collaborator = User.where(username: params[:username]).first

    if @collaborator.blank?
      redirect_to wiki_url(@wiki), flash[:error] = "could not find username"
    else
      @collaboration = @wiki.collaborations.build(user_id: @collaborator.id)
    
      if current_user.premium? && @collaboration.save
        redirect_to wiki_path(@wiki), flash[:success] = "Collaborator added successfully"
      else
        redirect_to wiki_url(@wiki), flash[:error] =  "Could not add collaborator"
      end
    end
  end

  def destroy
  end


  private
  
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end

end

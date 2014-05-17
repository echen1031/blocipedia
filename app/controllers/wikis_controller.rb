class WikisController < ApplicationController
  before_filter :set_wiki, only: [:show, :edit, :update, :destroy]
  before_filter :current_user_wikis
  
  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)

    authorize @wiki
    if @wiki.save
      redirect_to wikis_path, notice: 'Wiki saved successfully'
    else
      flash[:notice] = 'Wiki needs a name'
      render :new
    end
  end

  def edit
    authorize @wiki
  end

  def update
    authorize @wiki
    if @wiki.update_attributes(wiki_params)
      redirect_to wikis_path, notice: 'Wiki saved successfully'
    else
      flash[:notice] = 'Error saving wiki. Please try again'
      render :edit
    end
  end

  def show
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def destroy
    if @wiki.destroy
      flash[:notice] = "Wiki deleted successfully"
      redirect_to wikis_path
    else
      flash[:notice] = "Error deleting wiki. Please try again"
      render :show
    end
  end

  private 
    
  def wiki_params
    params.require(:wiki).permit(:name, :description, :public)
  end

  def set_wiki
    @wiki = Wiki.find(params[:id])
  end

  def current_user_wikis
    @my_wiki = current_user.wikis
  end
end

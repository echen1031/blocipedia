class WikisController < ApplicationController
  before_filter :set_wiki, only: [:show, :edit, :update, :destroy]
  
  def index
    @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)

    if @wiki.save
      redirect_to wikis_path, notice: 'Wiki saved successfully'
    else
      flash[:error] = 'Wiki needs a name'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    @marked_wiki = markdown.render(@wiki.description)
  end

  def destroy
  end

  private 
    
  def wiki_params
    params.require(:wiki).permit(:name, :description, :public)
  end

  def set_wiki
    @wiki = Wiki.find(params[:id])
  end
end

class WikisController < ApplicationController
  before_action :authorize_user, except: [:index, :show]
  
  def index
    @wikis = Wiki.all  
    # need to modificy for private
  end
  
  def show
    @wiki = Wiki.find(params[:id])
  end
  
  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = current_user
    
    if @wiki.save
      flash[:notice] = "Wiki post was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    
    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render edit
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
        flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
        redirect_to action: :index
    else
        flash.now[:alert] = "There was an error deleting the wiki."
        render :show
    end
  end
  
  private
  
  def authorize_user
    unless current_user.standard? || current_user.premium? || current_user.admin?
      flash[:alert] = "You must be logged in to do that."
      redirect_to wikis_path
    end
  end
end

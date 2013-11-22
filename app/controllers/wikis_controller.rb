class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize! :create, Wiki, message: "You must be a member to create a new Wiki."
  end

  def create
    @wiki = current_user.wikis.build(params[:wiki])
      authorize! :create, @wiki, message: "You must be signed in to do that."
      if @wiki.save
        flash[:notice] = "Wiki Created!"
        redirect_to @wiki
      else
        flash[:error] = "There was a problem saving your wiki. Please try again."
        render :new
      end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize! :edit, @wiki, message: "You must own the Wiki or be a collaborator to edit it."
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "You must own the Wiki or be a collaborator to edit it."
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was a problem updating your wiki. Please try again."
      render :edit
    end  
  end
end

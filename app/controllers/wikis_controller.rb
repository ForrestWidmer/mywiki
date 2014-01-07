class WikisController < ApplicationController
  
  def show
    @category = Category.find(params[:category_id])
    @wiki = Wiki.find(params[:id])
    @discussions = @wiki.discussions
    @discussion = Discussion.new
  end

  def index
    @wiki = Wiki.all
  end

  def new
    @category = Category.find(params[:category_id])
    @wiki = current_user.wikis.new
    #authorize! :create, Wiki, message: "You must be a member to create a new Wiki."
  end

  def create
    @category = Category.find(params[:category_id])
    @wiki = current_user.wikis.create(params[:wiki])
    @wiki.roles.build(level: "owner", user_id: current_user.id)
    @wiki.category = @category
      #authorize! :create, @wiki, message: "You must be signed in to do that."
      if @wiki.save
        flash[:notice] = "Wiki Created!"
        redirect_to [@category, @wiki]
      else
        flash[:error] = "There was a problem saving your wiki. Please try again."
        render :new
      end
  end

  def edit
    @category = Category.find(params[:category_id])
    @wiki = Wiki.find(params[:id])
    authorize! :edit, @wiki, message: "You must own the Wiki or be a collaborator to edit it."
  end

  def update
    @category = Category.find(params[:category_id])
    @wiki = Wiki.find(params[:id])
    authorize! :update, @wiki, message: "You must own the Wiki or be a collaborator to edit it."
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = "Wiki was updated."
      redirect_to [@category, @wiki]
    else
      flash[:error] = "There was a problem updating your wiki. Please try again."
      render :edit
    end  
  end
end

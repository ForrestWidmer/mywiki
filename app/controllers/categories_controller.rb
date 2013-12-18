class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    #authorize! :create, @category, message: "Only Admins and Mods can do that. If you would like a new category added please email our Administrators."
  end

  def show
    @category = Category.find(params[:id])
    @wikis = @category.wikis#.visible_to(current_user)
  end

  def edit
    @category = Category.find(params[:id])
    #authorize! :update, @category, message: "Only Admins and Mods can do that. If you would like to have a category updated or edited please email our Administrators."
  end

  def create
    @category = Category.new(params[:category])
    #authorize! :create, @category, message: "Only Admins and Mods can do that. If you would like a new category added please email our Administrators."
    if @category.save
      flash[:notice] = "Category was created successfully."
      redirect_to @category
    else
      flash[:error] = "Category was not created successfully. Please try again."
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    authorize! :update, @category, message: "Only Admins and Mods can do that. If you would like to have a category updated or edited please email our Administrators."
    if @category.update_attributes(params[:category])
      redirect_to @category
    else
      flash[:error] = "Category was not updated. Please try again."
      render :edit
    end
  end

end

class DiscussionsController < ApplicationController

  def create
    @category = Category.find(params[:category_id])
    @wiki = @category.wikis.find(params[:wiki_id])
    @discussions = @wiki.discussions

    @discussion = current_user.discussions.build(params[:discussion])
    @discussion.wiki = @wiki

    if @discussion.save
      flash[:notice] = "Discussion was created."
      redirect_to [@category, @wiki]
    else
      flash[:error] = "There was an error saving the discussion. Please try again."
      render 'wikis/show'
    end
  end

end

class CollaboratorsController < ApplicationController

  def show
  end

  def index
    @wiki = Wiki.find(params[:wiki_id])
    @users = User.all
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @wiki.user_id = params[:user_id]
  end
end
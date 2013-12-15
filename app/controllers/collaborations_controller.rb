class CollaborationsController < ApplicationController
  
  def index
    @user = User.all

  end

  def new
    @collaboration = Collaboration.new
    name = User.name
    authorize! :create, Collaboration, message: "You must be a premium user to create a collaboration."
    @collaboration.save!
  end  

  def create

    @wiki = Wiki.find(params[:wiki_id])
    
    @wiki.collaboration.new(user_id: params[:user_id])
    @wiki.save!
  end
  
end

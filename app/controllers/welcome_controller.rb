class WelcomeController < ApplicationController
  def index
    @wiki = Wiki.visible_to(current_user).all(:order => 'created_at DESC', :limit => 6)
  end

  def about
  end
end

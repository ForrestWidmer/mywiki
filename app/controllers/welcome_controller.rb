class WelcomeController < ApplicationController
  def index
    @wiki = Wiki.all(:order => 'created_at DESC', :limit => 30)
  end

  def about
  end
end

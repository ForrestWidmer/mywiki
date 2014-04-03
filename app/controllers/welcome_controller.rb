class WelcomeController < ApplicationController
  def index
    @wiki = Wiki.all(:order => 'created_at DESC', :limit => 6)
  end

  def about
  end
end

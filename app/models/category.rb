class Category < ActiveRecord::Base
  attr_accessible :description, :name, :public
  has_many :wikis
end

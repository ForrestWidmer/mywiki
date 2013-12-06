class Category < ActiveRecord::Base
  attr_accessible :description, :name, :public
  has_many :wikis

  scope :visible_to, lambda { |user| user ? scoped : where(public: true) }
end

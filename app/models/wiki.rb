class Wiki < ActiveRecord::Base
  has_many :discussions
  belongs_to :user
  belongs_to :category

  attr_accessible :body, :title, :category

  default_scope order('created_at DESC')
end

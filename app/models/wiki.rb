class Wiki < ActiveRecord::Base
  has_many :discussions
  belongs_to :user
  attr_accessible :body, :title

  default_scope order('created_at DESC')
end

class Create < ActiveRecord::Base
  has_many :discussions
  attr_accessible :body, :title
end

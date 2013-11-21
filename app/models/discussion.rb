class Discussion < ActiveRecord::Base
  belongs_to :create
  attr_accessible :body
end

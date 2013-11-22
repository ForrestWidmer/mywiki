class Discussion < ActiveRecord::Base
  belongs_to :wiki
  attr_accessible :body
end

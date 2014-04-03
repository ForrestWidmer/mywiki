class Discussion < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user
  attr_accessible :body, :wiki

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end

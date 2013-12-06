class Collaborator < ActiveRecord::Base
  attr_accessible :email, :name, :wiki
  belongs_to :wiki
  belongs_to :user
end

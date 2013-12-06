class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable

  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :role
  has_many :wikis
  has_many :discussions
  before_create :set_member
  mount_uploader :avatar, AvatarUploader

  has_and_belongs_to_many :wiki_collaborations, :join_table => 'wiki_collaborators'

  ROLES = %w[member paid moderator admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  private

  def set_member
    self.role = 'member'
  end
 

end

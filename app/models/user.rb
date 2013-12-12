class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable

  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :role, :username

  has_many :wikis
  has_many :discussions
  has_many :collaborations
  #has_many :wikis, :through => :collaborators

  before_create :set_member
  mount_uploader :avatar, AvatarUploader

  ROLES = %w[member paid moderator admin]
  def role?(base_role)
    role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  private

  def set_member
    self.role = 'member'
  end
 

end

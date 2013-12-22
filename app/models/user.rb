class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :confirmable

  
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar, :username

  has_many :discussions
  has_many :roles
  has_many :wikis, through: :roles

  before_create :set_member
  mount_uploader :avatar, AvatarUploader

  STATUSES = %w[free paid admin]
  def status?(base_status)
    status.nil? ? false : STATUSES.index(base_status.to_s) <= STATUSES.index(status)
  end

  private

  def set_member
    self.status = 'free'
  end
 

end

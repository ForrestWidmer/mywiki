class Wiki < ActiveRecord::Base
  has_many :discussions
  has_many :images, :dependent => :destroy
  has_many :roles
  has_many :users, through: :roles

  accepts_nested_attributes_for :roles
  
  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader

  attr_accessible :body, :title, :category_id, :category, :image, :images_attributes, :public, :collaborator, :level

  default_scope order('created_at DESC')

  scope :visible_to, lambda { |user| user ? scoped : where(public: true) }

  validates :title, length: { minimum: 5, maximum: 20 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :category, presence: true

  #after_create :set_owner
  
  #private

  #def set_owner
  #  Role.where(:wiki_id => self.id).first.level = "owner"
  #end

end

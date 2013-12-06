class Wiki < ActiveRecord::Base
  has_many :discussions
  has_many :images, :dependent => :destroy

  accepts_nested_attributes_for :images

  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader

  attr_accessible :body, :title, :category_id, :category, :image, :images_attributes, :public, :collaborator

  default_scope order('created_at DESC')

  scope :visible_to, lambda { |user| user ? scoped : where(public: true) }

  validates :title, length: { minimum: 5, maximum: 20 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :category, presence: true
  validates :user, presence: true

  has_and_belongs_to_many :collaborators, :class_name => 'User', :join_table => 'wiki_collaborators'

end

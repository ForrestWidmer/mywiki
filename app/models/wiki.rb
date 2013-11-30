class Wiki < ActiveRecord::Base
  has_many :discussions
  belongs_to :user
  belongs_to :category
  mount_uploader :image, ImageUploader

  attr_accessible :body, :title, :category_id, :category, :image

  default_scope order('created_at DESC')

  validates :title, length: { minimum: 5, maximum: 20 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :category, presence: true
  validates :user, presence: true

end

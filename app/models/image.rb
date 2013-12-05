class Image < ActiveRecord::Base
  belongs_to :wiki

  attr_accessible :image

  mount_uploader :image, ImageUploader
end

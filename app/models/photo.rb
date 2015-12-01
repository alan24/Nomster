class Photo < ActiveRecord::Base
  belongs_to :place
  validates :picture, :presence => true
  validates :caption, :presence => true
  mount_uploader :picture, PictureUploader
end

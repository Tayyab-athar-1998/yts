class Image < ApplicationRecord
  mount_uploader :path, ImageUploader

  belongs_to :imageable, polymorphic: true, inverse_of: :imageable, optional: true
end

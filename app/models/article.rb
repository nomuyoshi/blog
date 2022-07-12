class Article < ApplicationRecord
  has_one_attached :eye_catching_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
end

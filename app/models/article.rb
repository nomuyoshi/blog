class Article < ApplicationRecord
  has_one_attached :eye_catching_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end

  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  scope :published, -> { where(published: true).order(updated_at: :desc) }
end

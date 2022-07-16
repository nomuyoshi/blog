class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  # 先祖カテゴリ
  has_many :ancestor_paths, ->{ order(depth: :desc) }, class_name: "CategoryTreePath", foreign_key: "descendant_id"
  has_many :ancestors, through: :ancestor_paths, source: :ancestor_category

  # 子孫カテゴリ
  has_many :descendant_paths, ->{ order(depth: :asc) }, class_name: "CategoryTreePath", foreign_key: "ancestor_id"
  has_many :descendants, through: :descendant_paths, source: :descendant_category
end

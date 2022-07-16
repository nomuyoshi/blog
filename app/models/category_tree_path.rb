class CategoryTreePath < ApplicationRecord
  belongs_to :ancestor_category, class_name: "Category", foreign_key: "ancestor_id"
  belongs_to :descendant_category, class_name: "Category", foreign_key: "descendant_id"
end

class CategoryTree < ApplicationRecord
  belongs_to :parent_id
  belongs_to :child_id
end

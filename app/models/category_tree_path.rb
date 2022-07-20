class CategoryTreePath < ApplicationRecord
  belongs_to :ancestor_category, class_name: "Category", foreign_key: "ancestor_id"
  belongs_to :descendant_category, class_name: "Category", foreign_key: "descendant_id"

  scope :children_paths, ->{ where(depth: 1) }

  def self.root_ids
    root_paths = self.group(:descendant_id).having("count(*) = ?", 1).select(:descendant_id)
    root_paths.map(&:descendant_id)
  end

  def self.children_path_hash
    @children_paths ||= self.children_paths.group_by(&:ancestor_id)
  end
end

class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  # 先祖カテゴリ
  has_many :ancestor_paths, ->{ order(depth: :desc) }, class_name: "CategoryTreePath", foreign_key: "descendant_id"
  has_many :ancestors, through: :ancestor_paths, source: :ancestor_category

  # 子孫カテゴリ
  has_many :descendant_paths, ->{ order(depth: :asc) }, class_name: "CategoryTreePath", foreign_key: "ancestor_id"
  has_many :descendants, through: :descendant_paths, source: :descendant_category

  def self.roots
    self.where(id: CategoryTreePath.root_ids)
  end

  def self.hash_tree
    roots = self.roots
    _hash_tree(roots, {})
  end

  # routesを:id->:nameにするために必要
  def to_param
    slug
  end

  private

  def self._hash_tree(categories, tree)
    categories.each do |c|
      tree[c] = {}
      next if CategoryTreePath.children_path_hash[c.id].nil?

      child_categories = CategoryTreePath.children_path_hash[c.id].map { |path| category_hash[path.descendant_id] }
      tree[c] = _hash_tree(child_categories, {})
    end

    tree
  end

  def self.category_hash
    @category_hash ||= Category.all.index_by(&:id)
  end
end

class RenameCategoryTreesTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :category_trees, :parent_id, :ancestor_id
    rename_column :category_trees, :child_id, :descendant_id
    rename_table :category_trees, :category_tree_paths
  end
end

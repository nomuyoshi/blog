class AddDepthToCategoryTree < ActiveRecord::Migration[7.0]
  def change
    add_column :category_trees, :depth, :integer, null: false
  end
end

class CreateCategoryTrees < ActiveRecord::Migration[7.0]
  def change
    create_table :category_trees do |t|
      t.integer :parent_id, null: false, foreign_key: true
      t.integer :child_id, null: false, foreign_key: true

      t.timestamps
    end

    add_index :category_trees, [:parent_id, :child_id], unique: true
  end
end

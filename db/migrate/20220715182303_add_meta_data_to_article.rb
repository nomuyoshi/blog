class AddMetaDataToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :keywards, :string
    add_column :articles, :description, :string
  end
end

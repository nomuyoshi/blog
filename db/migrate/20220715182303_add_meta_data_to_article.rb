class AddMetaDataToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :description, :string, after: :slug
    add_column :articles, :keywords, :string, after: :slug
  end
end

class DropPublishedAtColumnFromArticle < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :published_at
  end
end

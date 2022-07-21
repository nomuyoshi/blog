class AddPublishedAtToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :published_at, :datetime, after: :published
  end
end

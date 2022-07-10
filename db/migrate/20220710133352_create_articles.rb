class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.boolean :published
      t.datetime :published_at

      t.timestamps
    end
  end
end

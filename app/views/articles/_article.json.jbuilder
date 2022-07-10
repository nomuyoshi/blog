json.extract! article, :id, :title, :slug, :body, :published, :published_at, :created_at, :updated_at
json.url article_url(article, format: :json)

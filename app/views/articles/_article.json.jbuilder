json.extract! article, :id, :title, :published, :tags, :body, :author, :image, :slug, :meta_description, :meta_title, :created_at, :updated_at
json.url article_url(article, format: :html)
json.image_url article.image_url
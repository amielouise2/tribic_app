class AddColumnsToTableArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :slug, :string
    add_column :articles, :meta_description, :string
    add_column :articles, :meta_title, :string
  end
end

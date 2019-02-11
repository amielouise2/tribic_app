class RenameColumnPublishedInArticlesTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :published, :published_on
    
  end
end

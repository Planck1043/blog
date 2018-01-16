class AddArticleCountToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :article_count, :integer, default: 0
  end
end

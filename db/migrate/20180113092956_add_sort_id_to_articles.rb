class AddSortIdToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :sort_id, :integer, default: 1
  end
end

class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string  :title
      t.text    :text
      t.string  :article_state
      t.integer :article_clicks,  default: 0

      t.timestamps
    end
  end
end

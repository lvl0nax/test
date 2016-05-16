class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.datetime :published_at
      t.boolean :is_published
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :articles, :published_at
  end
end

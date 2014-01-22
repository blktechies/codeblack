class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.string :source
      t.string :content
      t.references :user, index: true

      t.timestamps
    end
  end
end

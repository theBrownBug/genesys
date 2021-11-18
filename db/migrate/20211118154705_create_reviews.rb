class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :body
      t.integer :rating
      t.integer :likes
      t.integer :dislikes
      t.boolean :is_live

      t.timestamps
    end
  end
end

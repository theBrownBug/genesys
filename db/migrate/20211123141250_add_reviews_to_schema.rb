class AddReviewsToSchema < ActiveRecord::Migration[6.1]
  def change
    create_table "reviews", force: :cascade do |t|
      t.string "title"
      t.string "body"
      t.integer "rating"
      t.integer "likes"
      t.boolean "is_live"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end

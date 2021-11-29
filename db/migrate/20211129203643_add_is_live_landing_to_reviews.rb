class AddIsLiveLandingToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :is_live_landing, :boolean
  end
end

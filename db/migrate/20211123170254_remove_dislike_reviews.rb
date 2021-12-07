# frozen_string_literal: true

class RemoveDislikeReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :dislikes
  end
end

# frozen_string_literal: true

class AddOrderNoToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :order_no, :integer
  end
end

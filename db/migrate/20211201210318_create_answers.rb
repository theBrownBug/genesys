# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :rating
      t.integer :likes
      t.references :questions, null: false, foreign_key: true

      t.timestamps
    end
  end
end

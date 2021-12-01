class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.boolean :is_live
      t.integer :popularity

      t.timestamps
    end
  end
end

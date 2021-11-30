class CreateClicks < ActiveRecord::Migration[6.1]
  def change
    create_table :clicks do |t|
      t.string :session_id
      t.string :path
      t.string :category
      t.string :value

      t.timestamps
    end
  end
end

class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.datetime :from
      t.datetime :to
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end

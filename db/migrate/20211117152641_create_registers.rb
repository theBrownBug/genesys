class CreateRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :registers do |t|
      t.string :email
      t.integer :poption

      t.timestamps
    end
  end
end

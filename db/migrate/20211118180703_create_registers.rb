# frozen_string_literal: true

# Create the table for interested users
class CreateRegisters < ActiveRecord::Migration[6.1]
  def change
    create_table :registers do |t|
      t.string :email
      t.integer :option

      t.timestamps
    end
  end
end

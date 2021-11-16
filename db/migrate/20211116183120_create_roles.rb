class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :role_type
      t.boolean :is_active
      t.boolean :is_current

      t.timestamps
    end
  end
end

class MakeRoleTypeUniqueInRoles < ActiveRecord::Migration[6.1]
  change_table :roles do |t|
    t.change :role_type, :integer, unique: :true
  end
end

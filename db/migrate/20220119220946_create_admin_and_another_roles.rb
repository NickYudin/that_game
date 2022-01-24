class CreateAdminAndAnotherRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_and_another_roles do |t|

      t.timestamps
    end
  end
end

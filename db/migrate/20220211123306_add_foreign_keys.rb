class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :ability_tables, :characters
    add_foreign_key :char_classes, :hit_dices
    add_foreign_key :characters, :users
    add_foreign_key :characters,  :char_classes
    add_foreign_key :characters, :races
    add_foreign_key :race_increases, :races
    add_foreign_key :users, :roles

  end
end

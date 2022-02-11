class AddIndexToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_index :characters, :user_id
    add_index :characters,  :char_class_id
    add_index :characters, :race_id

  end
end

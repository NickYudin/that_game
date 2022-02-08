class AddCharClassToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :char_class_id, :integer
  end
end

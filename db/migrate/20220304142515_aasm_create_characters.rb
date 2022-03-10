class AasmCreateCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :aasm_state, :string
  end
end

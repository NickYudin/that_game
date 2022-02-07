class AddAasmStateToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :aasm_state, :string
  end
end

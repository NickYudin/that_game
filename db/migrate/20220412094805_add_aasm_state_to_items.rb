class AddAasmStateToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :aasm_state, :string
  end
end

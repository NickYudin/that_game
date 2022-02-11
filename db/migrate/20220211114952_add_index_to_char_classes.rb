class AddIndexToCharClasses < ActiveRecord::Migration[7.0]
  def change
    add_index :char_classes, :hit_dice_id
  end
end

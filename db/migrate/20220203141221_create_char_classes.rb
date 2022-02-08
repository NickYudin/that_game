class CreateCharClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :char_classes do |t|
      t.string :name
      t.integer :hit_dice_id

      t.timestamps
    end
  end
end

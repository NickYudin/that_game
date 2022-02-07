class AddDefaultValuesForChars < ActiveRecord::Migration[7.0]
  def change
    change_column_default(
      :characters,
      :health,
      0
    )
    change_column_default(
      :characters,
      :experiense,
      0
    )
    change_column_default(
      :characters,
      :power,
      0
    )
  end
end

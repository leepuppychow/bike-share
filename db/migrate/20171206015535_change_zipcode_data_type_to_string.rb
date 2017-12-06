class ChangeZipcodeDataTypeToString < ActiveRecord::Migration[5.1]
  def change
    change_column :trips, :zip_code, :text
  end
end

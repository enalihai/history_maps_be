class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :location, :title
  end
end

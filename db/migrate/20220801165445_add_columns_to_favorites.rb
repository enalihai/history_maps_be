class AddColumnsToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :photo, :string
    add_column :favorites, :location_id, :string
    add_column :favorites, :other_titles, :string
    add_column :favorites, :details, :string
    add_column :favorites, :pdf, :string
  end
end

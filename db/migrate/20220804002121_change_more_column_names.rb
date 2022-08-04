class ChangeMoreColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :favorites, :location_id, :short_id
    rename_column :favorites, :photo, :image_full
    rename_column :favorites, :pdf, :thumbnail
    rename_column :favorites, :details, :creator
    rename_column :favorites, :other_titles, :published_date
  end
end

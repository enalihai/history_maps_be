class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end

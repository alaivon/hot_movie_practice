class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :director
      t.integer :category_id
      t.integer :length

      t.timestamps null: false
    end
  end
end

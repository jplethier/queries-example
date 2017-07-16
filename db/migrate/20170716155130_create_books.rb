class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.text :description
      t.string :title
      t.string :category
      t.integer :pages_count
      t.string :language
      t.decimal :average_rating, precision: 10, scale: 6
      t.datetime :published_at

      t.timestamps
    end
  end
end

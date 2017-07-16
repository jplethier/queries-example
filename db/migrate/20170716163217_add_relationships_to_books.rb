class AddRelationshipsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :author, foreign_key: true, index: true
    add_reference :books, :publisher, foreign_key: true, index: true
  end
end

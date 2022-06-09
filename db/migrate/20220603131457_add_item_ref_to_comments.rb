class AddItemRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :item, null: false, foreign_key: true
  end
end

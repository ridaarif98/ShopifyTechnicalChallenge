class AddColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :dell, :boolean, default: false
  end
end

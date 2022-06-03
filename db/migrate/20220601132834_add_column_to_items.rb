class AddColumnToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :hide, :boolean, default: false
  end
end

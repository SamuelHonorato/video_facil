class AddCategoryIdToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :category_id, :integer
  end
end

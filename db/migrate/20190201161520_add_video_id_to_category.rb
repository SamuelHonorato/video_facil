class AddVideoIdToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :video_id, :integer
  end
end

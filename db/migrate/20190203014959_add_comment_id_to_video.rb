class AddCommentIdToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :comment_id, :integer
  end
end

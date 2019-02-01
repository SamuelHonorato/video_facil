class Category < ApplicationRecord
  has_many :videos

  validates :name, presence: true
  validates :name, length: { maximum: 16 }

  before_destroy :destroy_all_videos

  def destroy_all_videos
    self.videos.destroy_all
  end

end

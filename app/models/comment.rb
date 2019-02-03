class Comment < ApplicationRecord
  belongs_to :video

  validates :author, presence: true
  validates :message, presence: true
end

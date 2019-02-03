class Video < ApplicationRecord
  belongs_to :category
  has_many :comments
  
  validates :category_id, presence: true

end

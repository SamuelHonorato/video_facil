class Category < ApplicationRecord
  has_many :videos

  validates :name, presence: true
  validates :name, length: { maximum: 16 }

end

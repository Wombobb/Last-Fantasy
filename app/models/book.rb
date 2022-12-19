class Book < ApplicationRecord
  belongs_to :user
  has_many :chapters

  validates :title, presence: true
  validates :summary, presence: true
end

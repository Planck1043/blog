class Sort < ApplicationRecord
  validates :name, presence: true

  # belongs_to :categories
  has_many :articles
end

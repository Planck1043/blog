class Article < ApplicationRecord
  validates :title, presence: true

  belongs_to :sort
  # belongs_to :category
end

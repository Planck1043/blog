class Article < ApplicationRecord
  validates :title, presence: true

  belongs_to :sort
  # belongs_to :category

  def self.title_sort(hash)
    u = hash[:title_name]
    k = u[0,4]
    if k == "世界大同"
      hash[:article].title = hash[:article].title.gsub(/世界大同/, "")
      hash[:article].sort_id = 2
    elsif k == "全力以赴"
      hash[:article] = hash[:article].gsub(/全力以赴/, "")
      hash[:article].sort_id = 3
    elsif k == "顺流而下"
      hash[:article].title = hash[:article].title.gsub(/顺流而下/, "")
      hash[:article].sort_id = 4
    end

    k = u[0,3]
    if k == "全世界"
      hash[:article].title = hash[:article].title.gsub(/全世界/, "")
      hash[:article].sort_id = 5
    elsif k == "大西洋"
      hash[:article].title = hash[:article].title.gsub(/大西洋/, "")
      hash[:article].sort_id = 6
    elsif k == "中南海"
      hash[:article].title = hash[:article].title.gsub(/中南海/, "")
      hash[:article].sort_id = 7
    end
  end
end

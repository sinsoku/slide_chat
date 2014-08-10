class Slide < ActiveRecord::Base
  has_many :comments

  validates :url, presence: true

  def slideshare_id
    url.split('-').last
  end
end

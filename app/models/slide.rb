class Slide < ActiveRecord::Base
  has_many :comments

  def slideshare_id
    url.split('-').last
  end
end

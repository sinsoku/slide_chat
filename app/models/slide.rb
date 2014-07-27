class Slide < ActiveRecord::Base
  def slideshare_id
    url.split('-').last
  end
end

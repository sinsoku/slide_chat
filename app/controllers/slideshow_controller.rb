class SlideshowController < ApplicationController
  def embed_code
    uri = URI.parse "http://www.slideshare.net/slideshow/embed_code/#{params[:id]}"
    render text: Net::HTTP.get(uri)
  end
end

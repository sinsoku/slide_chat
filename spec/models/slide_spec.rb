require 'rails_helper'

RSpec.describe Slide, :type => :model do
  describe '#slideshare_id' do
    it 'SlideShareのIDが返されること' do
      slide = Slide.new(url: 'http://www.slideshare.net/sinsoku/git-28491305')
      expect(slide.slideshare_id).to eq '28491305'
    end
  end
end

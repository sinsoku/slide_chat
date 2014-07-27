require 'rails_helper'

RSpec.describe "Slides", :type => :request do
  describe "GET /slides" do
    it "works! (now write some real specs)" do
      get slides_path
      expect(response.status).to be(200)
    end
  end
end

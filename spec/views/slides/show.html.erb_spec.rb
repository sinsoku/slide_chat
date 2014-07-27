require 'rails_helper'

RSpec.describe "slides/show", :type => :view do
  before(:each) do
    @slide = assign(:slide, Slide.create!(
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
  end
end

require 'rails_helper'

RSpec.describe "slides/index", :type => :view do
  before(:each) do
    assign(:slides, [
      Slide.create!(
        :url => "Url"
      ),
      Slide.create!(
        :url => "Url"
      )
    ])
  end

  it "renders a list of slides" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end

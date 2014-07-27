require 'rails_helper'

RSpec.describe "slides/edit", :type => :view do
  before(:each) do
    @slide = assign(:slide, Slide.create!(
      :url => "MyString"
    ))
  end

  it "renders the edit slide form" do
    render

    assert_select "form[action=?][method=?]", slide_path(@slide), "post" do

      assert_select "input#slide_url[name=?]", "slide[url]"
    end
  end
end

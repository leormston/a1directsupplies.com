require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :description => "MyText",
        :part_number => "Part Number",
        :image_url => "Image Url",
        :price => 2.5,
        :category => "Category",
        :brand => "Brand"
      ),
      Product.create!(
        :name => "Name",
        :description => "MyText",
        :part_number => "Part Number",
        :image_url => "Image Url",
        :price => 2.5,
        :category => "Category",
        :brand => "Brand"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Part Number".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Brand".to_s, :count => 2
  end
end

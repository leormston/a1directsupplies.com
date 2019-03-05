require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name",
      :description => "MyText",
      :part_number => "Part Number",
      :image_url => "Image Url",
      :price => 2.5,
      :category => "Category",
      :brand => "Brand"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Part Number/)
    expect(rendered).to match(/Image Url/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Brand/)
  end
end

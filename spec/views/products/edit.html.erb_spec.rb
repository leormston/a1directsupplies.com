require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :description => "MyText",
      :part_number => "MyString",
      :image_url => "MyString",
      :price => 1.5,
      :category => "MyString",
      :brand => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[name]"

      assert_select "textarea[name=?]", "product[description]"

      assert_select "input[name=?]", "product[part_number]"

      assert_select "input[name=?]", "product[image_url]"

      assert_select "input[name=?]", "product[price]"

      assert_select "input[name=?]", "product[category]"

      assert_select "input[name=?]", "product[brand]"
    end
  end
end

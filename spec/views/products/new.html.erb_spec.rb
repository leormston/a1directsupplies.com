require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :name => "MyString",
      :description => "MyText",
      :part_number => "MyString",
      :image_url => "MyString",
      :price => 1.5,
      :category => "MyString",
      :brand => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

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

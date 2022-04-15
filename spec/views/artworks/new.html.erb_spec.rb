require 'rails_helper'

RSpec.describe "artworks/new", type: :view do
  before(:each) do
    assign(:artwork, Artwork.new(
      user: nil,
      title: "MyString",
      description: "MyString",
      movement: "MyString",
      price: "MyString"
    ))
  end

  it "renders new artwork form" do
    render

    assert_select "form[action=?][method=?]", artworks_path, "post" do

      assert_select "input[name=?]", "artwork[user_id]"

      assert_select "input[name=?]", "artwork[title]"

      assert_select "input[name=?]", "artwork[description]"

      assert_select "input[name=?]", "artwork[movement]"

      assert_select "input[name=?]", "artwork[price]"
    end
  end
end

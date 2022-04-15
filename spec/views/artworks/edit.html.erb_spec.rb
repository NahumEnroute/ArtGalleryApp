require 'rails_helper'

RSpec.describe "artworks/edit", type: :view do
  before(:each) do
    @artwork = assign(:artwork, Artwork.create!(
      user: nil,
      title: "MyString",
      description: "MyString",
      movement: "MyString",
      price: "MyString"
    ))
  end

  it "renders the edit artwork form" do
    render

    assert_select "form[action=?][method=?]", artwork_path(@artwork), "post" do

      assert_select "input[name=?]", "artwork[user_id]"

      assert_select "input[name=?]", "artwork[title]"

      assert_select "input[name=?]", "artwork[description]"

      assert_select "input[name=?]", "artwork[movement]"

      assert_select "input[name=?]", "artwork[price]"
    end
  end
end

require 'rails_helper'

RSpec.describe "artworks/index", type: :view do
  before(:each) do
    assign(:artworks, [
      Artwork.create!(
        user: nil,
        title: "Title",
        description: "Description",
        movement: "Movement",
        price: "Price"
      ),
      Artwork.create!(
        user: nil,
        title: "Title",
        description: "Description",
        movement: "Movement",
        price: "Price"
      )
    ])
  end

  it "renders a list of artworks" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Movement".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Price".to_s), count: 2
  end
end

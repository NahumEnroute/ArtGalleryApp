require 'rails_helper'

RSpec.describe "artworks/show", type: :view do
  before(:each) do
    @artwork = assign(:artwork, Artwork.create!(
      user: nil,
      title: "Title",
      description: "Description",
      movement: "Movement",
      price: "Price"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Movement/)
    expect(rendered).to match(/Price/)
  end
end

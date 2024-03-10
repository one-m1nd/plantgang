require 'rails_helper'

RSpec.describe "wishlists/show", type: :view do
  before(:each) do
    assign(:wishlist, Wishlist.create!(name: 'giga'))
  end

  it "renders attributes in <p>" do
    render
  end
end

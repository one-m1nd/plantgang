require 'rails_helper'

RSpec.describe "wishlists/edit", type: :view do
  let(:wishlist) {
    Wishlist.create!(name: 'Euphorbia Atrox')
  }

  before(:each) do
    assign(:wishlist, wishlist)
  end

  it "renders the edit wishlist form" do
    render

    assert_select "form[action=?][method=?]", wishlist_path(wishlist), "post" do
    end
  end
end

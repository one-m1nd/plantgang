require 'rails_helper'

RSpec.describe "wishlists/index", type: :view do
  before(:each) do
    assign(:wishlists, [
      Wishlist.create!(name: 'giga'),
      Wishlist.create!(name: 'omega')
    ])
  end

  it "renders a list of wishlists" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end

require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do

  let(:book) { Fabricate(:book) }
  let(:cart) { Fabricate(:cart) }

  before { set_current_cart(cart) }
  
  describe "POST #create" do
    it "adds the new item to the cart" do
      post :create, cart_item: Fabricate.attributes_for(:cart_item, book: book, cart: cart), book_id: book.id

      expect(CartItem.count).to eq(1)
    end

    it "redirects to the catalog #index action" do
      post :create, cart_items: Fabricate.attributes_for(:cart_item, book: book, cart: cart), book_id: book.id

      expect(response).to redirect_to root_path
    end
  end
end

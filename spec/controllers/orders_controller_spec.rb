require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:sherlock) { Fabricate(:user) }
  before { set_current_user(sherlock) }

  describe "GET #new" do
    it "returns a successful http request status code" do
      get :new

      expect(response).to have_http_status(:success)
    end

    it "redirects to the 'sign in' page for unauthenticated users" do
      clear_current_user
      
      get :new
      expect(response).to redirect_to signin_path
    end
  end

  describe "POST #create" do
    let(:cart) { Fabricate(:cart) }
    let!(:book) { Fabricate(:book) }
    let!(:cart_item) { Fabricate(:cart_item, cart: cart, book: book) }
    let!(:cart_items) { cart.cart_items << cart_item }

    let(:token) do
      Stripe::Token.create(
        :card => {
        :number => '4242424242424242',
        :exp_month => 12,
        :exp_year => 2016,
        :cvc => 314
        }
      ).id
    end

    before do
      set_current_cart(cart)
    end

    it "saves the new order object" do
      post :create, order: Fabricate.attributes_for(:order, user: sherlock), stripeToken: token
      expect(Order.count).to eq(1)
    end

    it "sets the success flash message" do
      post :create, order: Fabricate.attributes_for(:order, user: sherlock), stripeToken: token
      expect(flash[:success]).to eq('Your order has been submitted.')
    end

    it "should send an email to the user email address" do
      ActionMailer::Base.deliveries = []

      post :create, order: Fabricate.attributes_for(:order, user: sherlock), stripeToken: token
      expect(ActionMailer::Base.deliveries.last.to).to eq([sherlock.email])
    end
  end

end

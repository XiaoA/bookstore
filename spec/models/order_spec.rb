require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:order_items) }

  it "should retun the total order amount" do
    book1 = Fabricate(:book, price: 30)
    book2 = Fabricate(:book, price: 40)
    order = Fabricate(:order)

    order_item1 = Fabricate(:order_item, order: order, book: book1, quantity: 2, price: 30)
    order_item2 = Fabricate(:order_item, order: order, book: book2, quantity: 1, price: 40)

    expect(order.order_total).to eq(100)
  end
  
end

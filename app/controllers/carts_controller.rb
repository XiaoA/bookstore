class CartsController < ApplicationController
  before_action :find_cart

  def show
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to catalogs_path
    flash[:success] = "The book was successfully removed from your cart."
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end

end

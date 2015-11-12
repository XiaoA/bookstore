class CartsController < ApplicationController
  before_action :find_cart

  def show
  end

  def destroy
    @cart.destroy
    session[:cart] = nil
    redirect_to catalogs_path
  end

  private

  def find_cart
    @cart = Cart.find(params[:id])
  end

end

class StoreController < ApplicationController
  def index
  # here we need to get the product out of the database and dislay in the store
  @products = Product.order(:title)
  end
end

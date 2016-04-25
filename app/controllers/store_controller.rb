class StoreController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @categories = Category.all
    @items = Item.all
    if current_user
      initialize_cart
    end
  end
end

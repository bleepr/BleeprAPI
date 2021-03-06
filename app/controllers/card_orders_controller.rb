class CardOrdersController < ApplicationController
  respond_to :json, :html
  def index
    @orders = Card.find(params[:card_id]).orders
    respond_with @orders
  end

  def incomplete
    @orders = Card.find(params[:card_id]).orders.where("status != ?", "complete")
    respond_with @orders
  end

  def new
    @order = Card.find(params[:card_id]).orders.new
    respond_with @order
  end

  def show
    @order = Order.find(params[:id])
    respond_with @order
  end

  def create
    @order = Card.find(params[:card_id]).orders.create(order_params)
    respond_with @order, location: -> {card_card_order_path(@order.card, @order)}
  end

  def update
    @order = Order.find(params[:id]).update_attributes(order_params)
    respond_with @order, location: -> {card_card_order_path(@order.card, @order)}
  end

  def destroy
    @order = Order.find(params[:id]).destroy
    respond_with @order
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :card_id, :status, :feedback)
    end
end

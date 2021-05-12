### Controller
class Api::V1::ItemsController < ApplicationController

  def update
    if @item.update(item_params)
      @item.update_total && @item.save
      @item.invoice.update_total && @item.invoice.save

      render json: @item, status: :accepted
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy 
    invoice = @item.invoice
    @item.destroy

    invoice.update_total && invoice.save
    render json: { message: "Item Deleted" }
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :quantity)
  end

  def find_item
    @item = Item.find_by(id: params[:id])
  end
end

### Model
class Item < ApplicationRecord
  belongs_to :invoice
  after_initialize :update_total

  def update_total
    self.total = self.price * self.quantity
  end
end

### Serializer
class ItemSerializer < ActiveModel::Serializer
  attributes :id
end
